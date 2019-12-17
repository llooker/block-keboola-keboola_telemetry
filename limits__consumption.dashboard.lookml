- dashboard: limits__consumption
  title: Limits & Consumption
  layout: newspaper
  elements:
  - name: 'scaffold'
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Keboola Telemetry</b></font>
    row: 0
    col: 0
    width: 6
    height: 2
  - name: 'dashboard'
    type: text
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Limits & Consumption</b></font>
    row: 0
    col: 6
    width: 12
    height: 2
  - name: 'poweredby'
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://www.keboola.com/data/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - name: Monthly Consumption
    title: Monthly Consumption
    merged_queries:
    - model: block_keboola_keboola_telemetry
      explore: contract_limit_monthly
      type: table
      fields: [contract_limit_monthly.date_month, contract_limit_monthly.limit_value,
        usage_metric.metric_group, usage_metric.usage_metric]
      sorts: [contract_limit_monthly.date_month 0, usage_metric.metric_group, usage_metric.usage_metric]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: block_keboola_keboola_telemetry
      explore: kbc_usage_metrics_values
      type: table
      fields: [usage_metric.usage_metric, kbc_usage_metrics_values.date_month, kbc_usage_metrics_values.monthly_value]
      sorts: [kbc_usage_metrics_values.date_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: usage_metric.usage_metric
        source_field_name: usage_metric.usage_metric
      - field_name: kbc_usage_metrics_values.date_month
        source_field_name: contract_limit_monthly.date_month
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      usage_metric.metric_group: Group
      usage_metric.usage_metric: Metric
      contract_limit_monthly.limit_value: Limit
      kbc_usage_metrics_values.monthly_value: Value
      contract_limit_monthly.date_month: Month
    series_cell_visualizations:
      contract_limit_monthly.limit_value:
        is_active: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: less than, value: 0.2, background_color: "#a2dcf3",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [usage]}, {type: less
          than, value: 0.8, background_color: "#49cec1", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [usage]}, {type: less than, value: 1, background_color: "#e9b404",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [usage]}, {type: greater
          than, value: 0.99, background_color: "#ed6168", font_color: !!null '', color_application: {
          collection_id: legacy, palette_id: legacy_diverging1, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [usage]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    hidden_fields: [usage_metric.metric_group]
    pivots: [contract_limit_monthly.date_month]
    dynamic_fields: [{table_calculation: usage, label: Usage, expression: "${kbc_usage_metrics_values.monthly_value}/${contract_limit_monthly.limit_value}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    listen:
    - Month: contract_limit_monthly.date_month
    - Month: kbc_usage_metrics_values.date_month
      KBC Project: kbc_project.kbc_project
    row: 4
    col: 0
    width: 24
    height: 6
  - title: Snowflake PPU
    name: Snowflake PPU
    model: block_keboola_keboola_telemetry
    explore: kbc_snowflake_stats
    type: single_value
    fields: [kbc_snowflake_stats.snowflake_queries_credits]
    filters:
      kbc_snowflake_stats.snowflake_job_type: "-EMPTY"
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "#,##0"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: sandbox - kbc_snowflake_stats.snowflake_queries_credits,
            id: sandbox - kbc_snowflake_stats.snowflake_queries_credits, name: sandbox},
          {axisId: transformations - kbc_snowflake_stats.snowflake_queries_credits,
            id: transformations - kbc_snowflake_stats.snowflake_queries_credits, name: transformations},
          {axisId: writer - kbc_snowflake_stats.snowflake_queries_credits, id: writer
              - kbc_snowflake_stats.snowflake_queries_credits, name: writer}], showLabels: false,
        showValues: true, valueFormat: "#,##0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      transformations - kbc_snowflake_stats.snowflake_queries_credits: "#353b49"
    series_labels:
      " - kbc_snowflake_stats.snowflake_queries_length_h": Other
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Month: kbc_snowflake_stats.snowflake_job_start_month
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 4
    width: 4
    height: 2
  - title: Jobs PPU
    name: Jobs PPU
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: single_value
    fields: [kbc_configuration_job.job_billed_credits_used]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    custom_color_enabled: true
    show_single_value_title: true
    value_format: "#,##0"
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: application - kbc_configuration_job.job_billed_credits_used,
            id: application - kbc_configuration_job.job_billed_credits_used, name: application},
          {axisId: extractor - kbc_configuration_job.job_billed_credits_used, id: extractor
              - kbc_configuration_job.job_billed_credits_used, name: extractor}, {
            axisId: other - kbc_configuration_job.job_billed_credits_used, id: other
              - kbc_configuration_job.job_billed_credits_used, name: other}, {axisId: transformation
              - kbc_configuration_job.job_billed_credits_used, id: transformation
              - kbc_configuration_job.job_billed_credits_used, name: transformation},
          {axisId: writer - kbc_configuration_job.job_billed_credits_used, id: writer
              - kbc_configuration_job.job_billed_credits_used, name: writer}, {axisId: kbc_component_configuration.kbc_component_type___null
              - kbc_configuration_job.job_billed_credits_used, id: kbc_component_configuration.kbc_component_type___null
              - kbc_configuration_job.job_billed_credits_used, name: "∅"}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Month: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 0
    width: 4
    height: 2
  - title: Snowflake Credits by Job Type
    name: Snowflake Credits by Job Type
    model: block_keboola_keboola_telemetry
    explore: kbc_snowflake_stats
    type: looker_area
    fields: [kbc_snowflake_stats.snowflake_job_start_month, kbc_snowflake_stats.snowflake_queries_credits,
      kbc_snowflake_stats.snowflake_job_type]
    pivots: [kbc_snowflake_stats.snowflake_job_type]
    fill_fields: [kbc_snowflake_stats.snowflake_job_start_month]
    filters:
      kbc_snowflake_stats.snowflake_job_type: "-EMPTY"
    sorts: [kbc_snowflake_stats.snowflake_job_start_month desc, kbc_snowflake_stats.snowflake_job_type]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: sandbox - kbc_snowflake_stats.snowflake_queries_credits,
            id: sandbox - kbc_snowflake_stats.snowflake_queries_credits, name: sandbox},
          {axisId: transformations - kbc_snowflake_stats.snowflake_queries_credits,
            id: transformations - kbc_snowflake_stats.snowflake_queries_credits, name: transformations},
          {axisId: writer - kbc_snowflake_stats.snowflake_queries_credits, id: writer
              - kbc_snowflake_stats.snowflake_queries_credits, name: writer}], showLabels: false,
        showValues: true, valueFormat: "#,##0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      transformations - kbc_snowflake_stats.snowflake_queries_credits: "#353b49"
    series_labels:
      " - kbc_snowflake_stats.snowflake_queries_length_h": Other
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Month: kbc_snowflake_stats.snowflake_job_start_month
      KBC Project: kbc_project.kbc_project
    row: 10
    col: 12
    width: 12
    height: 6
  - title: Jobs Credit Usage by Projects
    name: Jobs Credit Usage by Projects
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_area
    fields: [kbc_configuration_job.job_start_month, kbc_configuration_job.job_billed_credits_used,
      kbc_project.kbc_project]
    pivots: [kbc_project.kbc_project]
    fill_fields: [kbc_configuration_job.job_start_month]
    sorts: [kbc_configuration_job.job_start_month desc, kbc_project.kbc_project]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, showLabels: false, showValues: true, valueFormat: "#,##0",
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Month: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 16
    col: 0
    width: 12
    height: 8
  - title: Snowflake Credits by Project
    name: Snowflake Credits by Project
    model: block_keboola_keboola_telemetry
    explore: kbc_snowflake_stats
    type: looker_area
    fields: [kbc_snowflake_stats.snowflake_job_start_month, kbc_snowflake_stats.snowflake_queries_credits,
      kbc_project.kbc_project]
    pivots: [kbc_project.kbc_project]
    fill_fields: [kbc_snowflake_stats.snowflake_job_start_month]
    sorts: [kbc_snowflake_stats.snowflake_job_start_month desc]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: sandbox - kbc_snowflake_stats.snowflake_queries_credits,
            id: sandbox - kbc_snowflake_stats.snowflake_queries_credits, name: sandbox},
          {axisId: transformations - kbc_snowflake_stats.snowflake_queries_credits,
            id: transformations - kbc_snowflake_stats.snowflake_queries_credits, name: transformations},
          {axisId: writer - kbc_snowflake_stats.snowflake_queries_credits, id: writer
              - kbc_snowflake_stats.snowflake_queries_credits, name: writer}], showLabels: false,
        showValues: true, valueFormat: "#,##0", unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      transformations - kbc_snowflake_stats.snowflake_queries_credits: "#353b49"
    series_labels:
      " - kbc_snowflake_stats.snowflake_queries_length_h": Other
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Month: kbc_snowflake_stats.snowflake_job_start_month
      KBC Project: kbc_project.kbc_project
    row: 16
    col: 12
    width: 12
    height: 8
  - title: Jobs Credit Usage by Component Type
    name: Jobs Credit Usage by Component Type
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_area
    fields: [kbc_component_configuration.kbc_component_type, kbc_configuration_job.job_start_month,
      kbc_configuration_job.job_billed_credits_used]
    pivots: [kbc_component_configuration.kbc_component_type]
    fill_fields: [kbc_configuration_job.job_start_month]
    sorts: [kbc_configuration_job.job_start_month desc, kbc_component_configuration.kbc_component_type]
    limit: 500
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: application - kbc_configuration_job.job_billed_credits_used,
            id: application - kbc_configuration_job.job_billed_credits_used, name: application},
          {axisId: extractor - kbc_configuration_job.job_billed_credits_used, id: extractor
              - kbc_configuration_job.job_billed_credits_used, name: extractor}, {
            axisId: other - kbc_configuration_job.job_billed_credits_used, id: other
              - kbc_configuration_job.job_billed_credits_used, name: other}, {axisId: transformation
              - kbc_configuration_job.job_billed_credits_used, id: transformation
              - kbc_configuration_job.job_billed_credits_used, name: transformation},
          {axisId: writer - kbc_configuration_job.job_billed_credits_used, id: writer
              - kbc_configuration_job.job_billed_credits_used, name: writer}, {axisId: kbc_component_configuration.kbc_component_type___null
              - kbc_configuration_job.job_billed_credits_used, id: kbc_component_configuration.kbc_component_type___null
              - kbc_configuration_job.job_billed_credits_used, name: "∅"}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Month: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 10
    col: 0
    width: 12
    height: 6
  - name: Remaining PPU
    title: Remaining PPU
    merged_queries:
    - model: block_keboola_keboola_telemetry
      explore: contract_limit_monthly
      type: table
      fields: [contract_limit_monthly.date_month, contract_limit_monthly.limit_value,
        usage_metric.usage_metric]
      filters:
        usage_metric.usage_metric: KBC PPU
        contract_limit_monthly.date_month: 1 months
      sorts: [contract_limit_monthly.date_month 0, usage_metric.usage_metric]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: block_keboola_keboola_telemetry
      explore: kbc_usage_metrics_values
      type: table
      fields: [usage_metric.usage_metric, kbc_usage_metrics_values.date_month, kbc_usage_metrics_values.monthly_value]
      sorts: [kbc_usage_metrics_values.date_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: usage_metric.usage_metric
        source_field_name: usage_metric.usage_metric
      - field_name: kbc_usage_metrics_values.date_month
        source_field_name: contract_limit_monthly.date_month
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: 0, background_color: "#e9b404",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#ed6168", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: '',
        font_color: "#1ea8df", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      usage_metric.metric_group: Group
      usage_metric.usage_metric: Metric
      contract_limit_monthly.limit_value: Limit
      kbc_usage_metrics_values.monthly_value: Value
      contract_limit_monthly.date_month: Month
    series_cell_visualizations:
      contract_limit_monthly.limit_value:
        is_active: false
    table_theme: gray
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    type: single_value
    hidden_fields: [contract_limit_monthly.limit_value, kbc_usage_metrics_values.monthly_value]
    series_types: {}
    dynamic_fields: [{table_calculation: remaining_ppu, label: Remaining PPU, expression: "${contract_limit_monthly.limit_value}-${kbc_usage_metrics_values.monthly_value}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    listen:
    -
    - KBC Project: kbc_project.kbc_project
    row: 2
    col: 8
    width: 4
    height: 2
  - name: Remaining TB
    title: Remaining TB
    merged_queries:
    - model: block_keboola_keboola_telemetry
      explore: contract_limit_monthly
      type: table
      fields: [contract_limit_monthly.date_month, contract_limit_monthly.limit_value,
        usage_metric.usage_metric]
      filters:
        usage_metric.usage_metric: KBC TB
        contract_limit_monthly.date_month: 1 months
      sorts: [contract_limit_monthly.date_month 0, usage_metric.usage_metric]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: block_keboola_keboola_telemetry
      explore: kbc_usage_metrics_values
      type: table
      fields: [usage_metric.usage_metric, kbc_usage_metrics_values.date_month, kbc_usage_metrics_values.monthly_value]
      sorts: [kbc_usage_metrics_values.date_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: usage_metric.usage_metric
        source_field_name: usage_metric.usage_metric
      - field_name: kbc_usage_metrics_values.date_month
        source_field_name: contract_limit_monthly.date_month
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: 0, background_color: "#e9b404",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#ed6168", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: '',
        font_color: "#1ea8df", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      usage_metric.metric_group: Group
      usage_metric.usage_metric: Metric
      contract_limit_monthly.limit_value: Limit
      kbc_usage_metrics_values.monthly_value: Value
      contract_limit_monthly.date_month: Month
    series_cell_visualizations:
      contract_limit_monthly.limit_value:
        is_active: false
    table_theme: gray
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    type: single_value
    hidden_fields: [contract_limit_monthly.limit_value, kbc_usage_metrics_values.monthly_value]
    series_types: {}
    dynamic_fields: [{table_calculation: remaining_tb, label: Remaining TB, expression: "${contract_limit_monthly.limit_value}-${kbc_usage_metrics_values.monthly_value}",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}]
    listen:
    -
    - KBC Project: kbc_project.kbc_project
    row: 2
    col: 12
    width: 4
    height: 2
  - name: Remaining Projects
    title: Remaining Projects
    merged_queries:
    - model: block_keboola_keboola_telemetry
      explore: contract_limit_monthly
      type: table
      fields: [contract_limit_monthly.date_month, contract_limit_monthly.limit_value,
        usage_metric.usage_metric]
      filters:
        usage_metric.usage_metric: KBC Projects
        contract_limit_monthly.date_month: 1 months
      sorts: [contract_limit_monthly.date_month 0, usage_metric.usage_metric]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: block_keboola_keboola_telemetry
      explore: kbc_usage_metrics_values
      type: table
      fields: [usage_metric.usage_metric, kbc_usage_metrics_values.date_month, kbc_usage_metrics_values.monthly_value]
      sorts: [kbc_usage_metrics_values.date_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: usage_metric.usage_metric
        source_field_name: usage_metric.usage_metric
      - field_name: kbc_usage_metrics_values.date_month
        source_field_name: contract_limit_monthly.date_month
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: 0, background_color: "#e9b404",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#ed6168", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: '',
        font_color: "#1ea8df", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      usage_metric.metric_group: Group
      usage_metric.usage_metric: Metric
      contract_limit_monthly.limit_value: Limit
      kbc_usage_metrics_values.monthly_value: Value
      contract_limit_monthly.date_month: Month
    series_cell_visualizations:
      contract_limit_monthly.limit_value:
        is_active: false
    table_theme: gray
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    type: single_value
    hidden_fields: [contract_limit_monthly.limit_value, kbc_usage_metrics_values.monthly_value]
    series_types: {}
    dynamic_fields: [{table_calculation: remaining_projects, label: Remaining Projects,
        expression: "${contract_limit_monthly.limit_value}-${kbc_usage_metrics_values.monthly_value}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    listen:
    -
    - KBC Project: kbc_project.kbc_project
    row: 2
    col: 16
    width: 4
    height: 2
  - name: Remaining Users
    title: Remaining Users
    merged_queries:
    - model: block_keboola_keboola_telemetry
      explore: contract_limit_monthly
      type: table
      fields: [contract_limit_monthly.date_month, contract_limit_monthly.limit_value,
        usage_metric.usage_metric]
      filters:
        usage_metric.usage_metric: KBC Users
        contract_limit_monthly.date_month: 1 months
      sorts: [contract_limit_monthly.date_month 0, usage_metric.usage_metric]
      limit: 500
      query_timezone: America/Los_Angeles
    - model: block_keboola_keboola_telemetry
      explore: kbc_usage_metrics_values
      type: table
      fields: [usage_metric.usage_metric, kbc_usage_metrics_values.date_month, kbc_usage_metrics_values.monthly_value]
      sorts: [kbc_usage_metrics_values.date_month desc]
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: usage_metric.usage_metric
        source_field_name: usage_metric.usage_metric
      - field_name: kbc_usage_metrics_values.date_month
        source_field_name: contract_limit_monthly.date_month
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: equal to, value: 0, background_color: "#e9b404",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
          than, value: 0, background_color: '', font_color: "#ed6168", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: greater than, value: 0, background_color: '',
        font_color: "#1ea8df", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_labels:
      usage_metric.metric_group: Group
      usage_metric.usage_metric: Metric
      contract_limit_monthly.limit_value: Limit
      kbc_usage_metrics_values.monthly_value: Value
      contract_limit_monthly.date_month: Month
    series_cell_visualizations:
      contract_limit_monthly.limit_value:
        is_active: false
    table_theme: gray
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    type: single_value
    hidden_fields: [contract_limit_monthly.limit_value, kbc_usage_metrics_values.monthly_value]
    series_types: {}
    dynamic_fields: [{table_calculation: remaining_users, label: Remaining Users,
        expression: "${contract_limit_monthly.limit_value}-${kbc_usage_metrics_values.monthly_value}",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    listen:
    -
    - KBC Project: kbc_project.kbc_project
    row: 2
    col: 20
    width: 4
    height: 2
  filters:
  - name: Month
    title: Month
    type: date_filter
    default_value: 6 months
    allow_multiple_values: true
    required: false
  - name: KBC Project
    title: KBC Project
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: block_keboola_keboola_telemetry
    explore: kbc_project
    listens_to_filters: []
    field: kbc_project.kbc_project
