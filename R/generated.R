# Generated from the GeneFox runtime tool catalogue; do not edit.

gf_account_status <- function(session, progress_callback = NULL) {
    arguments <- list()
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "account_status", arguments, progress_callback)
}

gf_arrayexpress_details <- function(session, `accession`, `sample_offset` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `sample_offset` = `sample_offset`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "arrayexpress_details", arguments, progress_callback)
}

gf_arrayexpress_expression <- function(session, `accession`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `gene` = NULL, `group_by` = NULL, `height_in` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `gene` = `gene`, `group_by` = `group_by`, `height_in` = `height_in`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "arrayexpress_expression", arguments, progress_callback)
}

gf_arrayexpress_search <- function(session, `query`, `limit` = NULL, progress_callback = NULL) {
    arguments <- list(`query` = `query`, `limit` = `limit`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "arrayexpress_search", arguments, progress_callback)
}

gf_cbioportal_alterations <- function(session, `gene`, `study_id`, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `study_id` = `study_id`, `portal` = `portal`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_alterations", arguments, progress_callback)
}

gf_cbioportal_composition <- function(session, `study_id`, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`study_id` = `study_id`, `portal` = `portal`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_composition", arguments, progress_callback)
}

gf_cbioportal_cross_study_mutations <- function(session, `gene`, `studies`, `csv` = NULL, `generated_at` = NULL, `html` = NULL, `pdf` = NULL, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `studies` = `studies`, `csv` = `csv`, `generated_at` = `generated_at`, `html` = `html`, `pdf` = `pdf`, `portal` = `portal`)
    if (!is.null(arguments$`studies`)) arguments$`studies` <- unname(as.list(arguments$`studies`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_cross_study_mutations", arguments, progress_callback)
}

gf_cbioportal_expression <- function(session, `gene`, `study_id`, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `portal` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `subset` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `study_id` = `study_id`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `portal` = `portal`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `subset` = `subset`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_expression", arguments, progress_callback)
}

gf_cbioportal_mutation_burden <- function(session, `attribute_id`, `study_id`, `csv` = NULL, `generated_at` = NULL, `html` = NULL, `pdf` = NULL, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`attribute_id` = `attribute_id`, `study_id` = `study_id`, `csv` = `csv`, `generated_at` = `generated_at`, `html` = `html`, `pdf` = `pdf`, `portal` = `portal`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_mutation_burden", arguments, progress_callback)
}

gf_cbioportal_significantly_mutated_genes <- function(session, `study_id`, `csv` = NULL, `generated_at` = NULL, `html` = NULL, `pdf` = NULL, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`study_id` = `study_id`, `csv` = `csv`, `generated_at` = `generated_at`, `html` = `html`, `pdf` = `pdf`, `portal` = `portal`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_significantly_mutated_genes", arguments, progress_callback)
}

gf_cbioportal_structural_variants <- function(session, `gene`, `study_id`, `csv` = NULL, `generated_at` = NULL, `html` = NULL, `molecular_profile_id` = NULL, `pdf` = NULL, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `study_id` = `study_id`, `csv` = `csv`, `generated_at` = `generated_at`, `html` = `html`, `molecular_profile_id` = `molecular_profile_id`, `pdf` = `pdf`, `portal` = `portal`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_structural_variants", arguments, progress_callback)
}

gf_cbioportal_studies <- function(session, `portal` = NULL, progress_callback = NULL) {
    arguments <- list(`portal` = `portal`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_studies", arguments, progress_callback)
}

gf_cbioportal_treatment_counts <- function(session, `study_id`, `csv` = NULL, `generated_at` = NULL, `html` = NULL, `pdf` = NULL, `portal` = NULL, `sample_ids` = NULL, `tier` = NULL, progress_callback = NULL) {
    arguments <- list(`study_id` = `study_id`, `csv` = `csv`, `generated_at` = `generated_at`, `html` = `html`, `pdf` = `pdf`, `portal` = `portal`, `sample_ids` = `sample_ids`, `tier` = `tier`)
    if (!is.null(arguments$`sample_ids`)) arguments$`sample_ids` <- unname(as.list(arguments$`sample_ids`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "cbioportal_treatment_counts", arguments, progress_callback)
}

gf_gdc_project_summary <- function(session, `project`, progress_callback = NULL) {
    arguments <- list(`project` = `project`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "gdc_project_summary", arguments, progress_callback)
}

gf_gene_info <- function(session, `gene`, `organism` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `organism` = `organism`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "gene_info", arguments, progress_callback)
}

gf_geo_chat_schema <- function(session, `accession`, `platform` = NULL, `supplementary_file` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `platform` = `platform`, `supplementary_file` = `supplementary_file`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_chat_schema", arguments, progress_callback)
}

gf_geo_collection_summary <- function(session, `accessions`, `characteristic_key` = NULL, `detail` = NULL, `treatment_aliases` = NULL, `treatment_term` = NULL, progress_callback = NULL) {
    arguments <- list(`accessions` = `accessions`, `characteristic_key` = `characteristic_key`, `detail` = `detail`, `treatment_aliases` = `treatment_aliases`, `treatment_term` = `treatment_term`)
    if (!is.null(arguments$`accessions`)) arguments$`accessions` <- unname(as.list(arguments$`accessions`))
    if (!is.null(arguments$`treatment_aliases`)) arguments$`treatment_aliases` <- unname(as.list(arguments$`treatment_aliases`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_collection_summary", arguments, progress_callback)
}

gf_geo_dataset_details <- function(session, `accession`, `sample_offset` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `sample_offset` = `sample_offset`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_dataset_details", arguments, progress_callback)
}

gf_geo_finder_plan <- function(session, `text`, progress_callback = NULL) {
    arguments <- list(`text` = `text`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_finder_plan", arguments, progress_callback)
}

gf_geo_gene_correlation <- function(session, `accession`, `color_by` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `gene` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `keep_groups` = NULL, `method` = NULL, `normalization` = NULL, `outline_text` = NULL, `output_name` = NULL, `partner_gene` = NULL, `partner_probe` = NULL, `platform` = NULL, `probe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `color_by` = `color_by`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `gene` = `gene`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `keep_groups` = `keep_groups`, `method` = `method`, `normalization` = `normalization`, `outline_text` = `outline_text`, `output_name` = `output_name`, `partner_gene` = `partner_gene`, `partner_probe` = `partner_probe`, `platform` = `platform`, `probe` = `probe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_gene_correlation", arguments, progress_callback)
}

gf_geo_heatmap <- function(session, `accession`, `annotations` = NULL, `cluster_columns` = NULL, `cluster_rows` = NULL, `csv` = NULL, `dpi` = NULL, `exclude_low_depth` = NULL, `exclude_samples` = NULL, `figure` = NULL, `format` = NULL, `genes` = NULL, `group_by` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `keep_groups` = NULL, `low_depth_fraction` = NULL, `normalization` = NULL, `outline_text` = NULL, `output_name` = NULL, `platform` = NULL, `preset` = NULL, `probes` = NULL, `show_caption_color_keys` = NULL, `show_dendrograms` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, `z_normalize` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `annotations` = `annotations`, `cluster_columns` = `cluster_columns`, `cluster_rows` = `cluster_rows`, `csv` = `csv`, `dpi` = `dpi`, `exclude_low_depth` = `exclude_low_depth`, `exclude_samples` = `exclude_samples`, `figure` = `figure`, `format` = `format`, `genes` = `genes`, `group_by` = `group_by`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `keep_groups` = `keep_groups`, `low_depth_fraction` = `low_depth_fraction`, `normalization` = `normalization`, `outline_text` = `outline_text`, `output_name` = `output_name`, `platform` = `platform`, `preset` = `preset`, `probes` = `probes`, `show_caption_color_keys` = `show_caption_color_keys`, `show_dendrograms` = `show_dendrograms`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`, `z_normalize` = `z_normalize`)
    if (!is.null(arguments$`annotations`)) arguments$`annotations` <- unname(as.list(arguments$`annotations`))
    if (!is.null(arguments$`exclude_samples`)) arguments$`exclude_samples` <- unname(as.list(arguments$`exclude_samples`))
    if (!is.null(arguments$`genes`)) arguments$`genes` <- unname(as.list(arguments$`genes`))
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    if (!is.null(arguments$`probes`)) arguments$`probes` <- unname(as.list(arguments$`probes`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_heatmap", arguments, progress_callback)
}

gf_geo_numeric_series <- function(session, `accession`, `x_key`, `x_unit`, `band` = NULL, `center` = NULL, `csv` = NULL, `dpi` = NULL, `exclude_low_depth` = NULL, `figure` = NULL, `filters` = NULL, `format` = NULL, `gene` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `log_x` = NULL, `low_depth_fraction` = NULL, `normalization` = NULL, `outline_text` = NULL, `output_name` = NULL, `platform` = NULL, `probe` = NULL, `series_by` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `x_key` = `x_key`, `x_unit` = `x_unit`, `band` = `band`, `center` = `center`, `csv` = `csv`, `dpi` = `dpi`, `exclude_low_depth` = `exclude_low_depth`, `figure` = `figure`, `filters` = `filters`, `format` = `format`, `gene` = `gene`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `log_x` = `log_x`, `low_depth_fraction` = `low_depth_fraction`, `normalization` = `normalization`, `outline_text` = `outline_text`, `output_name` = `output_name`, `platform` = `platform`, `probe` = `probe`, `series_by` = `series_by`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`filters`)) arguments$`filters` <- lapply(arguments$`filters`, function(value) unname(as.list(value)))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_numeric_series", arguments, progress_callback)
}

gf_geo_sample_pca <- function(session, `accession`, `biplot` = NULL, `color_by` = NULL, `color_gene` = NULL, `color_probe` = NULL, `correlated_genes` = NULL, `csv` = NULL, `dpi` = NULL, `exclude_low_depth` = NULL, `exclude_samples` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `keep_groups` = NULL, `log_transform` = NULL, `low_depth_fraction` = NULL, `normalization` = NULL, `outline_text` = NULL, `output_name` = NULL, `platform` = NULL, `scale_genes` = NULL, `scree` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `top_genes` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `biplot` = `biplot`, `color_by` = `color_by`, `color_gene` = `color_gene`, `color_probe` = `color_probe`, `correlated_genes` = `correlated_genes`, `csv` = `csv`, `dpi` = `dpi`, `exclude_low_depth` = `exclude_low_depth`, `exclude_samples` = `exclude_samples`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `keep_groups` = `keep_groups`, `log_transform` = `log_transform`, `low_depth_fraction` = `low_depth_fraction`, `normalization` = `normalization`, `outline_text` = `outline_text`, `output_name` = `output_name`, `platform` = `platform`, `scale_genes` = `scale_genes`, `scree` = `scree`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `top_genes` = `top_genes`, `width_in` = `width_in`)
    if (!is.null(arguments$`exclude_samples`)) arguments$`exclude_samples` <- unname(as.list(arguments$`exclude_samples`))
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_sample_pca", arguments, progress_callback)
}

gf_geo_search <- function(session, `cursor` = NULL, `data_type` = NULL, `limit` = NULL, `min_samples` = NULL, `organism` = NULL, `query` = NULL, `smart_search` = NULL, `sort` = NULL, progress_callback = NULL) {
    arguments <- list(`cursor` = `cursor`, `data_type` = `data_type`, `limit` = `limit`, `min_samples` = `min_samples`, `organism` = `organism`, `query` = `query`, `smart_search` = `smart_search`, `sort` = `sort`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_search", arguments, progress_callback)
}

gf_geo_series_expression <- function(session, `accession`, `annotations` = NULL, `binning` = NULL, `cluster_columns` = NULL, `cluster_rows` = NULL, `csv` = NULL, `dpi` = NULL, `exclude_low_depth` = NULL, `exclude_samples` = NULL, `figure` = NULL, `figure_kind` = NULL, `format` = NULL, `gene` = NULL, `genes` = NULL, `geometry` = NULL, `group_by` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `keep_groups` = NULL, `low_depth_fraction` = NULL, `normalization` = NULL, `outline_text` = NULL, `output_name` = NULL, `platform` = NULL, `preset` = NULL, `probe` = NULL, `probes` = NULL, `recipe` = NULL, `secondary_binning` = NULL, `secondary_group_by` = NULL, `show_caption_color_keys` = NULL, `show_dendrograms` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, `z_normalize` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `annotations` = `annotations`, `binning` = `binning`, `cluster_columns` = `cluster_columns`, `cluster_rows` = `cluster_rows`, `csv` = `csv`, `dpi` = `dpi`, `exclude_low_depth` = `exclude_low_depth`, `exclude_samples` = `exclude_samples`, `figure` = `figure`, `figure_kind` = `figure_kind`, `format` = `format`, `gene` = `gene`, `genes` = `genes`, `geometry` = `geometry`, `group_by` = `group_by`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `keep_groups` = `keep_groups`, `low_depth_fraction` = `low_depth_fraction`, `normalization` = `normalization`, `outline_text` = `outline_text`, `output_name` = `output_name`, `platform` = `platform`, `preset` = `preset`, `probe` = `probe`, `probes` = `probes`, `recipe` = `recipe`, `secondary_binning` = `secondary_binning`, `secondary_group_by` = `secondary_group_by`, `show_caption_color_keys` = `show_caption_color_keys`, `show_dendrograms` = `show_dendrograms`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`, `z_normalize` = `z_normalize`)
    if (!is.null(arguments$`annotations`)) arguments$`annotations` <- unname(as.list(arguments$`annotations`))
    if (!is.null(arguments$`exclude_samples`)) arguments$`exclude_samples` <- unname(as.list(arguments$`exclude_samples`))
    if (!is.null(arguments$`genes`)) arguments$`genes` <- unname(as.list(arguments$`genes`))
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    if (!is.null(arguments$`probes`)) arguments$`probes` <- unname(as.list(arguments$`probes`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_series_expression", arguments, progress_callback)
}

gf_geo_supplementary_layout <- function(session, `accession`, `identifier_column` = NULL, `platform` = NULL, `supplementary_file` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `identifier_column` = `identifier_column`, `platform` = `platform`, `supplementary_file` = `supplementary_file`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_supplementary_layout", arguments, progress_callback)
}

gf_geo_survival <- function(session, `accession`, `dpi` = NULL, `event_key` = NULL, `event_values` = NULL, `figure` = NULL, `format` = NULL, `gene` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `normalization` = NULL, `outline_text` = NULL, `output_name` = NULL, `platform` = NULL, `probe` = NULL, `recipe` = NULL, `scrub_at_years` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `split_by_expression` = NULL, `split_comparison` = NULL, `split_scheme` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `time_key` = NULL, `time_unit` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `dpi` = `dpi`, `event_key` = `event_key`, `event_values` = `event_values`, `figure` = `figure`, `format` = `format`, `gene` = `gene`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `normalization` = `normalization`, `outline_text` = `outline_text`, `output_name` = `output_name`, `platform` = `platform`, `probe` = `probe`, `recipe` = `recipe`, `scrub_at_years` = `scrub_at_years`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `split_by_expression` = `split_by_expression`, `split_comparison` = `split_comparison`, `split_scheme` = `split_scheme`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `time_key` = `time_key`, `time_unit` = `time_unit`, `width_in` = `width_in`)
    if (!is.null(arguments$`event_values`)) arguments$`event_values` <- unname(as.list(arguments$`event_values`))
    if (!is.null(arguments$`scrub_at_years`)) arguments$`scrub_at_years` <- unname(as.list(arguments$`scrub_at_years`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_survival", arguments, progress_callback)
}

gf_geo_top_correlates <- function(session, `accession`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `gene` = NULL, `height_in` = NULL, `html` = NULL, `identifier_column` = NULL, `inline_image` = NULL, `limit` = NULL, `outline_text` = NULL, `output_name` = NULL, `platform` = NULL, `probe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `supplementary_file` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`accession` = `accession`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `gene` = `gene`, `height_in` = `height_in`, `html` = `html`, `identifier_column` = `identifier_column`, `inline_image` = `inline_image`, `limit` = `limit`, `outline_text` = `outline_text`, `output_name` = `output_name`, `platform` = `platform`, `probe` = `probe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `supplementary_file` = `supplementary_file`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "geo_top_correlates", arguments, progress_callback)
}

gf_gtex_tissue_expression <- function(session, `gene`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "gtex_tissue_expression", arguments, progress_callback)
}

gf_hpa_gene <- function(session, `gene`, `dpi` = NULL, `family` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `dpi` = `dpi`, `family` = `family`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "hpa_gene", arguments, progress_callback)
}

gf_imported_de_enrichment <- function(session, `comparison`, `complete_universe`, `source`, `table`, `csv` = NULL, `foreground_size` = NULL, `generated_at` = NULL, `html` = NULL, `pdf` = NULL, progress_callback = NULL) {
    arguments <- list(`comparison` = `comparison`, `complete_universe` = `complete_universe`, `source` = `source`, `table` = `table`, `csv` = `csv`, `foreground_size` = `foreground_size`, `generated_at` = `generated_at`, `html` = `html`, `pdf` = `pdf`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "imported_de_enrichment", arguments, progress_callback)
}

gf_list_coverage <- function(session, progress_callback = NULL) {
    arguments <- list()
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "list_coverage", arguments, progress_callback)
}

gf_list_operations <- function(session, progress_callback = NULL) {
    arguments <- list()
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "list_operations", arguments, progress_callback)
}

gf_list_signature_presets <- function(session, progress_callback = NULL) {
    arguments <- list()
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "list_signature_presets", arguments, progress_callback)
}

gf_open_destination <- function(session, `destination` = NULL, `figure` = NULL, `legacy_link` = NULL, `link` = NULL, `run` = NULL, progress_callback = NULL) {
    arguments <- list(`destination` = `destination`, `figure` = `figure`, `legacy_link` = `legacy_link`, `link` = `link`, `run` = `run`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "open_destination", arguments, progress_callback)
}

gf_reference_ccle_expression <- function(session, `gene`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `geometry` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `keep_groups` = NULL, `limit` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `saved_chart` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `stratify` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `geometry` = `geometry`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `keep_groups` = `keep_groups`, `limit` = `limit`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `saved_chart` = `saved_chart`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `stratify` = `stratify`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "reference_ccle_expression", arguments, progress_callback)
}

gf_reference_expression_atlas <- function(session, `gene`, `accession` = NULL, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `accession` = `accession`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "reference_expression_atlas", arguments, progress_callback)
}

gf_reference_expression_atlas_catalog <- function(session, `limit` = NULL, `search` = NULL, progress_callback = NULL) {
    arguments <- list(`limit` = `limit`, `search` = `search`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "reference_expression_atlas_catalog", arguments, progress_callback)
}

gf_reference_treehouse_expression <- function(session, `gene`, `chart` = NULL, `cohort` = NULL, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `stratify` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `chart` = `chart`, `cohort` = `cohort`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `stratify` = `stratify`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "reference_treehouse_expression", arguments, progress_callback)
}

gf_tcga_case_detail <- function(session, `case`, `project`, `files` = NULL, progress_callback = NULL) {
    arguments <- list(`case` = `case`, `project` = `project`, `files` = `files`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_case_detail", arguments, progress_callback)
}

gf_tcga_case_expression <- function(session, `case`, `project`, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `limit` = NULL, `metric` = NULL, `outline_text` = NULL, `output_name` = NULL, `search` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`case` = `case`, `project` = `project`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `limit` = `limit`, `metric` = `metric`, `outline_text` = `outline_text`, `output_name` = `output_name`, `search` = `search`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_case_expression", arguments, progress_callback)
}

gf_tcga_cases <- function(session, `project`, `from` = NULL, `page_size` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `from` = `from`, `page_size` = `page_size`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_cases", arguments, progress_callback)
}

gf_tcga_chat_schema <- function(session, `project`, progress_callback = NULL) {
    arguments <- list(`project` = `project`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_chat_schema", arguments, progress_callback)
}

gf_tcga_cohort_composition <- function(session, `project`, `csv` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `csv` = `csv`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_cohort_composition", arguments, progress_callback)
}

gf_tcga_cohort_summary <- function(session, `project`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `figure_kind` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `variable` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `figure_kind` = `figure_kind`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `variable` = `variable`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_cohort_summary", arguments, progress_callback)
}

gf_tcga_compare_cohorts <- function(session, `gene`, `project_ids`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `geometry` = NULL, `height_in` = NULL, `html` = NULL, `include_adjacent` = NULL, `include_gtex` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `project_ids` = `project_ids`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `geometry` = `geometry`, `height_in` = `height_in`, `html` = `html`, `include_adjacent` = `include_adjacent`, `include_gtex` = `include_gtex`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`project_ids`)) arguments$`project_ids` <- unname(as.list(arguments$`project_ids`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_compare_cohorts", arguments, progress_callback)
}

gf_tcga_differential_expression <- function(session, `project`, `arm_order` = NULL, `csv` = NULL, `dpi` = NULL, `factor` = NULL, `figure` = NULL, `format` = NULL, `genes` = NULL, `group1` = NULL, `group2` = NULL, `gtex_tissue` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `log2fc_cutoff` = NULL, `mode` = NULL, `outline_text` = NULL, `output_name` = NULL, `preset` = NULL, `q_cutoff` = NULL, `recipe` = NULL, `selection` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `sort` = NULL, `split_gene` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `arm_order` = `arm_order`, `csv` = `csv`, `dpi` = `dpi`, `factor` = `factor`, `figure` = `figure`, `format` = `format`, `genes` = `genes`, `group1` = `group1`, `group2` = `group2`, `gtex_tissue` = `gtex_tissue`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `log2fc_cutoff` = `log2fc_cutoff`, `mode` = `mode`, `outline_text` = `outline_text`, `output_name` = `output_name`, `preset` = `preset`, `q_cutoff` = `q_cutoff`, `recipe` = `recipe`, `selection` = `selection`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `sort` = `sort`, `split_gene` = `split_gene`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`genes`)) arguments$`genes` <- unname(as.list(arguments$`genes`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_differential_expression", arguments, progress_callback)
}

gf_tcga_expression <- function(session, `gene`, `project`, `brackets` = NULL, `brackets_correction` = NULL, `brackets_test` = NULL, `color_by` = NULL, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `figure_kind` = NULL, `format` = NULL, `geometry` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `keep_color_groups` = NULL, `keep_groups` = NULL, `method` = NULL, `mutation_gene` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `saved_chart` = NULL, `second_gene` = NULL, `selection` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `specific_mutation` = NULL, `stratify` = NULL, `stratify_derived` = NULL, `stratify_secondary` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `track` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `project` = `project`, `brackets` = `brackets`, `brackets_correction` = `brackets_correction`, `brackets_test` = `brackets_test`, `color_by` = `color_by`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `figure_kind` = `figure_kind`, `format` = `format`, `geometry` = `geometry`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `keep_color_groups` = `keep_color_groups`, `keep_groups` = `keep_groups`, `method` = `method`, `mutation_gene` = `mutation_gene`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `saved_chart` = `saved_chart`, `second_gene` = `second_gene`, `selection` = `selection`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `specific_mutation` = `specific_mutation`, `stratify` = `stratify`, `stratify_derived` = `stratify_derived`, `stratify_secondary` = `stratify_secondary`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `track` = `track`, `width_in` = `width_in`)
    if (!is.null(arguments$`keep_color_groups`)) arguments$`keep_color_groups` <- unname(as.list(arguments$`keep_color_groups`))
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_expression", arguments, progress_callback)
}

gf_tcga_gene_isoforms <- function(session, `gene`, `project`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `geometry` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `project` = `project`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `geometry` = `geometry`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_gene_isoforms", arguments, progress_callback)
}

gf_tcga_gene_signature <- function(session, `project`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `figure_kind` = NULL, `format` = NULL, `genes` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `method` = NULL, `mutation_gene` = NULL, `name` = NULL, `outcome` = NULL, `outline_text` = NULL, `output_name` = NULL, `preset` = NULL, `recipe` = NULL, `selection` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `split_comparison` = NULL, `split_scheme` = NULL, `stratify` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `figure_kind` = `figure_kind`, `format` = `format`, `genes` = `genes`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `method` = `method`, `mutation_gene` = `mutation_gene`, `name` = `name`, `outcome` = `outcome`, `outline_text` = `outline_text`, `output_name` = `output_name`, `preset` = `preset`, `recipe` = `recipe`, `selection` = `selection`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `split_comparison` = `split_comparison`, `split_scheme` = `split_scheme`, `stratify` = `stratify`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`genes`)) arguments$`genes` <- unname(as.list(arguments$`genes`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_gene_signature", arguments, progress_callback)
}

gf_tcga_heatmap <- function(session, `project`, `annotations` = NULL, `cluster_columns` = NULL, `cluster_rows` = NULL, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `from_differential_expression` = NULL, `genes` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `mutation_genes` = NULL, `outline_text` = NULL, `output_name` = NULL, `pinned_genes` = NULL, `preset` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_dendrograms` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `top_n` = NULL, `width_in` = NULL, `z_normalize` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `annotations` = `annotations`, `cluster_columns` = `cluster_columns`, `cluster_rows` = `cluster_rows`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `from_differential_expression` = `from_differential_expression`, `genes` = `genes`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `mutation_genes` = `mutation_genes`, `outline_text` = `outline_text`, `output_name` = `output_name`, `pinned_genes` = `pinned_genes`, `preset` = `preset`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_dendrograms` = `show_dendrograms`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `top_n` = `top_n`, `width_in` = `width_in`, `z_normalize` = `z_normalize`)
    if (!is.null(arguments$`annotations`)) arguments$`annotations` <- unname(as.list(arguments$`annotations`))
    if (!is.null(arguments$`genes`)) arguments$`genes` <- unname(as.list(arguments$`genes`))
    if (!is.null(arguments$`mutation_genes`)) arguments$`mutation_genes` <- unname(as.list(arguments$`mutation_genes`))
    if (!is.null(arguments$`pinned_genes`)) arguments$`pinned_genes` <- unname(as.list(arguments$`pinned_genes`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_heatmap", arguments, progress_callback)
}

gf_tcga_pan_cancer_expression <- function(session, `gene`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `sort` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `sort` = `sort`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_pan_cancer_expression", arguments, progress_callback)
}

gf_tcga_pan_cancer_survival <- function(session, `gene`, `cohort` = NULL, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `scrub_at_years` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `cohort` = `cohort`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `scrub_at_years` = `scrub_at_years`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`scrub_at_years`)) arguments$`scrub_at_years` <- unname(as.list(arguments$`scrub_at_years`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_pan_cancer_survival", arguments, progress_callback)
}

gf_tcga_projects <- function(session, `search` = NULL, progress_callback = NULL) {
    arguments <- list(`search` = `search`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_projects", arguments, progress_callback)
}

gf_tcga_sample_pca <- function(session, `project`, `biplot` = NULL, `color_by` = NULL, `color_gene` = NULL, `correlated_genes` = NULL, `csv` = NULL, `dpi` = NULL, `exclude_samples` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `keep_groups` = NULL, `log_transform` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `scale_genes` = NULL, `scree` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `biplot` = `biplot`, `color_by` = `color_by`, `color_gene` = `color_gene`, `correlated_genes` = `correlated_genes`, `csv` = `csv`, `dpi` = `dpi`, `exclude_samples` = `exclude_samples`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `keep_groups` = `keep_groups`, `log_transform` = `log_transform`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `scale_genes` = `scale_genes`, `scree` = `scree`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`exclude_samples`)) arguments$`exclude_samples` <- unname(as.list(arguments$`exclude_samples`))
    if (!is.null(arguments$`keep_groups`)) arguments$`keep_groups` <- unname(as.list(arguments$`keep_groups`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_sample_pca", arguments, progress_callback)
}

gf_tcga_survival <- function(session, `project`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `gene` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outcome` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `scrub_at_years` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `split_comparison` = NULL, `split_on` = NULL, `split_scheme` = NULL, `stratify` = NULL, `stratify_derived` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`project` = `project`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `gene` = `gene`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outcome` = `outcome`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `scrub_at_years` = `scrub_at_years`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `split_comparison` = `split_comparison`, `split_on` = `split_on`, `split_scheme` = `split_scheme`, `stratify` = `stratify`, `stratify_derived` = `stratify_derived`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    if (!is.null(arguments$`scrub_at_years`)) arguments$`scrub_at_years` <- unname(as.list(arguments$`scrub_at_years`))
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_survival", arguments, progress_callback)
}

gf_tcga_top_correlates <- function(session, `gene`, `project`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `limit` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `project` = `project`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `limit` = `limit`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_top_correlates", arguments, progress_callback)
}

gf_tcga_tumor_normal <- function(session, `gene`, `project`, `csv` = NULL, `dpi` = NULL, `figure` = NULL, `format` = NULL, `geometry` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `recipe` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`gene` = `gene`, `project` = `project`, `csv` = `csv`, `dpi` = `dpi`, `figure` = `figure`, `format` = `format`, `geometry` = `geometry`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `recipe` = `recipe`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "tcga_tumor_normal", arguments, progress_callback)
}

gf_toxicodb_analysis <- function(session, `compound` = NULL, `csv` = NULL, `dataset` = NULL, `gene` = NULL, `limit` = NULL, `max_fdr` = NULL, `species` = NULL, progress_callback = NULL) {
    arguments <- list(`compound` = `compound`, `csv` = `csv`, `dataset` = `dataset`, `gene` = `gene`, `limit` = `limit`, `max_fdr` = `max_fdr`, `species` = `species`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "toxicodb_analysis", arguments, progress_callback)
}

gf_toxicodb_experiments <- function(session, `compound`, `gene`, `cell` = NULL, `center` = NULL, `csv` = NULL, `dataset` = NULL, `dpi` = NULL, `figure` = NULL, `figure_kind` = NULL, `format` = NULL, `height_in` = NULL, `html` = NULL, `inline_image` = NULL, `outline_text` = NULL, `output_name` = NULL, `show_caption_color_keys` = NULL, `show_figure_legends` = NULL, `show_row_counts` = NULL, `size` = NULL, `species` = NULL, `survival_detail` = NULL, `survival_median_lines` = NULL, `width_in` = NULL, progress_callback = NULL) {
    arguments <- list(`compound` = `compound`, `gene` = `gene`, `cell` = `cell`, `center` = `center`, `csv` = `csv`, `dataset` = `dataset`, `dpi` = `dpi`, `figure` = `figure`, `figure_kind` = `figure_kind`, `format` = `format`, `height_in` = `height_in`, `html` = `html`, `inline_image` = `inline_image`, `outline_text` = `outline_text`, `output_name` = `output_name`, `show_caption_color_keys` = `show_caption_color_keys`, `show_figure_legends` = `show_figure_legends`, `show_row_counts` = `show_row_counts`, `size` = `size`, `species` = `species`, `survival_detail` = `survival_detail`, `survival_median_lines` = `survival_median_lines`, `width_in` = `width_in`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "toxicodb_experiments", arguments, progress_callback)
}

gf_toxicodb_search <- function(session, `kind`, `query`, `limit` = NULL, `species` = NULL, progress_callback = NULL) {
    arguments <- list(`kind` = `kind`, `query` = `query`, `limit` = `limit`, `species` = `species`)
    arguments <- Filter(Negate(is.null), arguments)
    gf_call(session, "toxicodb_search", arguments, progress_callback)
}
