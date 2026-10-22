#define R_NO_REMAP
#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>
#include <R_ext/Visibility.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#ifdef _WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#endif

/* The SDK stays loaded for process lifetime: Swift may have shared cache tasks
 * finishing after cancellation. Only session handles are closed/finalized. */
typedef struct {
    uint32_t (*abi)(void), (*contract)(void);
    void *(*create)(const char *, char **);
    void (*destroy)(void *), (*string_free)(char *), (*bytes_free)(uint8_t *);
    int32_t (*submit)(void *, const char *);
    char *(*event)(void *);
    int32_t (*artifact)(void *, const char *, uint8_t **, size_t *, char **);
} sdk_api;
static sdk_api api;
static char *loaded_path = NULL;
typedef struct { void *session; } sdk_session;

static const char *text(SEXP value) {
    if (TYPEOF(value) != STRSXP || XLENGTH(value) != 1 || STRING_ELT(value, 0) == NA_STRING)
        Rf_error("Expected one non-missing string.");
    return Rf_translateCharUTF8(STRING_ELT(value, 0));
}
static sdk_session *session(SEXP value) {
    if (TYPEOF(value) != EXTPTRSXP || R_ExternalPtrTag(value) != Rf_install("GeneFoxSession"))
        Rf_error("Expected a GeneFox native session.");
    sdk_session *s = R_ExternalPtrAddr(value);
    if (!s || !s->session) Rf_error("GeneFox session is closed.");
    return s;
}
static void finalize(SEXP value) {
    sdk_session *s = R_ExternalPtrAddr(value);
    if (s) { if (s->session) api.destroy(s->session); free(s); R_ClearExternalPtr(value); }
}
static void sdk_error(char *message) {
    if (!message) Rf_error("GeneFox native operation failed.");
    size_t n = strlen(message);
    char *copy = R_alloc(n + 1, 1);
    memcpy(copy, message, n + 1);
    api.string_free(message);
    Rf_error("GeneFox: %s", copy);
}

static SEXP gf_open(SEXP path, SEXP configuration) {
    const char *name = text(path);
    if (loaded_path && strcmp(loaded_path, name)) Rf_error("Use one GeneFox runtime library per R process.");
    if (!loaded_path) {
#ifdef _WIN32
        int count = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, name, -1, NULL, 0);
        if (!count) Rf_error("Invalid UTF-8 library path.");
        wchar_t *wide = (wchar_t *)R_alloc(count, sizeof(wchar_t));
        MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, name, -1, wide, count);
        /* Dependencies must be adjacent to this explicitly selected runtime or in
         * trusted OS/default directories; never broaden lookup to cwd/PATH. */
        HMODULE handle = LoadLibraryExW(wide, NULL,
            LOAD_LIBRARY_SEARCH_DLL_LOAD_DIR | LOAD_LIBRARY_SEARCH_DEFAULT_DIRS);
        if (!handle) Rf_error("Could not load the GeneFox runtime library.");
#define SYMBOL(n) GetProcAddress(handle, n)
#else
        void *handle = dlopen(name, RTLD_NOW | RTLD_LOCAL);
        if (!handle) Rf_error("Could not load GeneFox: %s", dlerror());
#define SYMBOL(n) dlsym(handle, n)
#endif
#define LOAD(field, symbol) do { *(void **)(&api.field) = (void *)SYMBOL(symbol); if (!api.field) Rf_error("Missing SDK symbol %s", symbol); } while (0)
        LOAD(abi, "fox_abi_version"); LOAD(contract, "fox_sdk_contract_version");
        if (api.abi() != 1 || api.contract() != 1) Rf_error("Unsupported GeneFox ABI or SDK contract.");
        LOAD(create, "fox_session_create"); LOAD(destroy, "fox_session_destroy");
        LOAD(submit, "fox_request_submit"); LOAD(event, "fox_event_next");
        LOAD(artifact, "fox_artifact_read"); LOAD(string_free, "fox_string_free"); LOAD(bytes_free, "fox_bytes_free");
        loaded_path = malloc(strlen(name) + 1);
        if (!loaded_path) Rf_error("Could not allocate runtime path.");
        strcpy(loaded_path, name);
    }
    char *error = NULL;
    void *native = api.create(text(configuration), &error);
    if (!native) sdk_error(error);
    sdk_session *s = calloc(1, sizeof(*s));
    if (!s) { api.destroy(native); Rf_error("Could not allocate session."); }
    s->session = native;
    SEXP result = PROTECT(R_MakeExternalPtr(s, Rf_install("GeneFoxSession"), R_NilValue));
    R_RegisterCFinalizerEx(result, finalize, TRUE);
    UNPROTECT(1);
    return result;
}
static SEXP gf_close_native(SEXP value) {
    if (TYPEOF(value) != EXTPTRSXP || R_ExternalPtrTag(value) != Rf_install("GeneFoxSession"))
        Rf_error("Expected a GeneFox native session.");
    finalize(value); return R_NilValue;
}
static SEXP gf_submit_native(SEXP value, SEXP request) {
    return Rf_ScalarInteger(api.submit(session(value)->session, text(request)));
}
static SEXP gf_event_native(SEXP value) {
    char *event = api.event(session(value)->session);
    if (!event) return R_NilValue;
    SEXP result = PROTECT(Rf_ScalarString(Rf_mkCharCE(event, CE_UTF8)));
    api.string_free(event); UNPROTECT(1); return result;
}
static SEXP gf_artifact_native(SEXP value, SEXP path) {
    uint8_t *bytes = NULL; size_t length = 0; char *error = NULL;
    if (api.artifact(session(value)->session, text(path), &bytes, &length, &error)) sdk_error(error);
    if (length > 64 * 1024 * 1024) { api.bytes_free(bytes); Rf_error("Artifact exceeds the read limit."); }
    SEXP result = PROTECT(Rf_allocVector(RAWSXP, (R_xlen_t)length));
    memcpy(RAW(result), bytes, length); api.bytes_free(bytes); UNPROTECT(1); return result;
}
static const R_CallMethodDef methods[] = {
    {"gf_open", (DL_FUNC)&gf_open, 2}, {"gf_close_native", (DL_FUNC)&gf_close_native, 1},
    {"gf_submit_native", (DL_FUNC)&gf_submit_native, 2}, {"gf_event_native", (DL_FUNC)&gf_event_native, 1},
    {"gf_artifact_native", (DL_FUNC)&gf_artifact_native, 2}, {NULL, NULL, 0}
};
void attribute_visible R_init_genefox(DllInfo *dll) { R_registerRoutines(dll, NULL, methods, NULL, NULL); R_useDynamicSymbols(dll, FALSE); }
