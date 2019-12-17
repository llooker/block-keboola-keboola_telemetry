- dashboard: configurations__jobs
  title: Configurations & Jobs
  layout: newspaper
  elements:
  - name: 'poweredby'
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://www.keboola.com/data/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - name: 'scaffold'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Keboola Telemetry</b></font>
    row: 0
    col: 0
    width: 6
    height: 2
  - name: 'dashboard'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Configurations & Jobs</b></font>
    body_text: ''
    row: 0
    col: 6
    width: 12
    height: 2
  - title: Live Components
    name: Live Components
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: single_value
    fields: [kbc_component_configuration.components]
    filters:
      kbc_configuration_job.count: ">0"
      kbc_configuration_job.job_start_date: 30 days
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 0
    width: 4
    height: 2
  - title: Live Configurations
    name: Live Configurations
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: single_value
    fields: [kbc_component_configuration.configurations]
    filters:
      kbc_configuration_job.count: ">0"
      kbc_component_configuration.kbc_component: "-Orchestrator"
      kbc_configuration_job.job_start_date: 30 days
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 4
    width: 4
    height: 2
  - title: Active Users
    name: Active Users
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: single_value
    fields: [kbc_configuration_job.tokens]
    filters:
      kbc_configuration_job.count: ">0"
      kbc_configuration_job.job_start_date: 30 days
      kbc_configuration_job.token_name: "%@%"
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 12
    width: 4
    height: 2
  - title: Live Orchestrations
    name: Live Orchestrations
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: single_value
    fields: [kbc_component_configuration.configurations]
    filters:
      kbc_configuration_job.count: ">0"
      kbc_component_configuration.kbc_component: Orchestrator
      kbc_configuration_job.job_start_date: 30 days
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 8
    width: 4
    height: 2
  - title: Recent Error Ratio
    name: Recent Error Ratio
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: single_value
    fields: [kbc_configuration_job.error_ratio]
    filters:
      kbc_configuration_job.job_start_date: 30 days
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    label_value_format: ''
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      KBC Project: kbc_project.kbc_project
    row: 2
    col: 16
    width: 8
    height: 2
  - title: The 10 Most Used Configurations
    name: The 10 Most Used Configurations
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_bar
    fields: [kbc_component_configuration.kbc_component, kbc_configuration_job.count,
      kbc_component_configuration.kbc_component_configuration_id]
    filters:
      kbc_component_configuration.kbc_component: "-Orchestrator"
    sorts: [kbc_configuration_job.count desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 4
    col: 0
    width: 12
    height: 5
  - title: Successful/Error Jobs
    name: Successful/Error Jobs
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_area
    fields: [kbc_configuration_job.error_jobs, kbc_configuration_job.successfull_jobs,
      kbc_configuration_job.job_start_month]
    fill_fields: [kbc_configuration_job.job_start_month]
    filters:
      kbc_component_configuration.kbc_component: "-Orchestrator"
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
      kbc_configuration_job.count: "#1ea8df"
      kbc_configuration_job.successfull_jobs: "#49cec1"
      kbc_configuration_job.error_jobs: "#ed6168"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Date: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 9
    col: 0
    width: 12
    height: 5
  - title: Users With Highest Error Ratio
    name: Users With Highest Error Ratio
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_bar
    fields: [kbc_configuration_job.token_name, kbc_configuration_job.error_ratio]
    filters:
      kbc_configuration_job.token_name: "%@%"
    sorts: [kbc_configuration_job.error_ratio desc]
    limit: 5
    row_total: right
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: application - kbc_configuration_job.count,
            id: application - kbc_configuration_job.count, name: application}, {axisId: extractor
              - kbc_configuration_job.count, id: extractor - kbc_configuration_job.count,
            name: extractor}, {axisId: other - kbc_configuration_job.count, id: other
              - kbc_configuration_job.count, name: other}, {axisId: transformation
              - kbc_configuration_job.count, id: transformation - kbc_configuration_job.count,
            name: transformation}, {axisId: writer - kbc_configuration_job.count,
            id: writer - kbc_configuration_job.count, name: writer}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
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
      kbc_configuration_job.count: "#1ea8df"
      kbc_configuration_job.successfull_jobs: "#49cec1"
      kbc_configuration_job.error_jobs: "#ed6168"
      kbc_configuration_job.error_ratio: "#ed6168"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#353b49"
    show_null_points: true
    interpolation: linear
    listen:
      Date: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 14
    col: 12
    width: 12
    height: 5
  - title: The 10 Most Demanding Configurations
    name: The 10 Most Demanding Configurations
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_bar
    fields: [kbc_component_configuration.kbc_component, kbc_component_configuration.kbc_component_configuration_id,
      kbc_configuration_job.job_billed_credits_used]
    filters:
      kbc_component_configuration.kbc_component: "-Orchestrator"
    sorts: [kbc_configuration_job.job_billed_credits_used desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.job_billed_credits_used,
            id: kbc_configuration_job.job_billed_credits_used, name: Job Billed Credits
              Used}], showLabels: false, showValues: true, valueFormat: "#,##0", unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    label_value_format: "#,##0"
    series_types: {}
    point_style: none
    series_colors:
      kbc_configuration_job.count: "#1ea8df"
      kbc_configuration_job.job_billed_credits_used: "#ed6168"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Date: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 4
    col: 12
    width: 12
    height: 5
  - title: The Most Active Users
    name: The Most Active Users
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_bar
    fields: [kbc_configuration_job.count, kbc_configuration_job.token_name, kbc_component_configuration.kbc_component_type]
    pivots: [kbc_component_configuration.kbc_component_type]
    filters:
      kbc_configuration_job.token_name: "%@%"
      kbc_component_configuration.kbc_component_type: "-NULL"
    sorts: [kbc_configuration_job.count desc 5, kbc_component_configuration.kbc_component_type
        0]
    limit: 5
    row_total: right
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: application - kbc_configuration_job.count,
            id: application - kbc_configuration_job.count, name: application}, {axisId: extractor
              - kbc_configuration_job.count, id: extractor - kbc_configuration_job.count,
            name: extractor}, {axisId: other - kbc_configuration_job.count, id: other
              - kbc_configuration_job.count, name: other}, {axisId: transformation
              - kbc_configuration_job.count, id: transformation - kbc_configuration_job.count,
            name: transformation}, {axisId: writer - kbc_configuration_job.count,
            id: writer - kbc_configuration_job.count, name: writer}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
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
      kbc_configuration_job.count: "#1ea8df"
      kbc_configuration_job.successfull_jobs: "#49cec1"
      kbc_configuration_job.error_jobs: "#ed6168"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#353b49"
    show_null_points: true
    interpolation: linear
    listen:
      Date: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 14
    col: 0
    width: 12
    height: 5
  - title: Successful/Error Orchestrations
    name: Successful/Error Orchestrations
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_area
    fields: [kbc_configuration_job.error_jobs, kbc_configuration_job.successfull_jobs,
      kbc_configuration_job.job_start_month]
    fill_fields: [kbc_configuration_job.job_start_month]
    filters:
      kbc_component_configuration.kbc_component: Orchestrator
    sorts: [kbc_configuration_job.job_start_month desc]
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: kbc_configuration_job.count,
            id: kbc_configuration_job.count, name: Total Jobs}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
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
      kbc_configuration_job.count: "#1ea8df"
      kbc_configuration_job.successfull_jobs: "#49cec1"
      kbc_configuration_job.error_jobs: "#ed6168"
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    listen:
      Date: kbc_configuration_job.job_start_month
      KBC Project: kbc_project.kbc_project
    row: 9
    col: 12
    width: 12
    height: 5
  - title: Unused Configurations
    name: Unused Configurations
    model: block_keboola_keboola_telemetry
    explore: kbc_configuration_job
    type: looker_grid
    fields: [kbc_component_configuration.kbc_component, kbc_component_configuration.kbc_component_configuration_id,
      kbc_component_configuration.last_job_start, kbc_project.kbc_project]
    filters:
      kbc_component_configuration.last_job_start: before 30 days ago
    sorts: [days_since_last_run desc]
    limit: 500
    dynamic_fields: [{table_calculation: days_since_last_run, label: Days Since Last
          Run, expression: 'diff_days(${kbc_component_configuration.last_job_start},
          now())', value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3,
          options: {steps: 5, reverse: true}}, bold: false, italic: false, strikethrough: false,
        fields: [days_since_last_run]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      KBC Project: kbc_project.kbc_project
    row: 19
    col: 0
    width: 24
    height: 9
  filters:
  - name: Date
    title: Date
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
