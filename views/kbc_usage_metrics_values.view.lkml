view: kbc_usage_metrics_values {
  label: "KBC Usage Metrics Value"
  sql_table_name: KBC_USAGE_METRICS_VALUES ;;

  set: org_project_breakdown {
    fields: [
      kbc_organization.kbc_organization,
      kbc_project.kbc_project,
      usage_breakdown,
      is_sandbox
    ]
  }

  dimension: metrics_values_id {
    type: string
    sql: ${TABLE}."METRICS_VALUES_ID" ;;
  }

  dimension: kbc_project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
  }

  dimension: usage_metric_id {
    type: string
    hidden: yes
    sql: ${TABLE}."USAGE_METRIC_ID" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: is_sandbox {
    type: string
    sql: ${TABLE}."IS_SANDBOX" ;;
  }

  dimension: usage_breakdown {
    type: string
    sql: ${TABLE}."USAGE_BREAKDOWN" ;;
  }

  dimension: value_dimension {
    type: number
    sql: ${TABLE}."VALUE" ;;
  }

  dimension: organization_value_dimension {
    type: number
    sql: ${TABLE}."ORGANIZATION_VALUE" ;;
  }

  measure: monthly_value {
    type: number
    sql: CASE
          WHEN ${usage_metric_id} IN ('kbc_ppu','kbc_elapsed_hours')
          THEN SUM(${value_dimension})
          WHEN ${usage_metric_id} IN ('kbc_projects','gd_projects','gd_users')
          THEN CEIL(SUM(${value_dimension})/COUNT(DISTINCT ${TABLE}."DATE"))
          WHEN ${usage_metric_id} IN ('kbc_users')
          THEN CEIL(SUM(${organization_value_dimension})/COUNT(DISTINCT ${TABLE}."DATE"))
          ELSE (SUM(${value_dimension})/COUNT(DISTINCT ${TABLE}."DATE"))
         END;;
    required_fields: [usage_metric_id]
    value_format: "#,##0.00"
    drill_fields: [org_project_breakdown*, monthly_value_project]
  }

  measure: monthly_value_project {
    type: number
    sql: CASE
          WHEN ${usage_metric_id} IN ('kbc_ppu','kbc_elapsed_hours')
          THEN SUM(${usage_metric_id})
          WHEN ${usage_metric_id} IN ('kbc_projects','gd_projects','kbc_users','gd_users')
          THEN CEIL(SUM(${usage_metric_id})/COUNT(DISTINCT ${TABLE}."DATE"))
          ELSE (SUM(${usage_metric_id})/COUNT(DISTINCT ${TABLE}."DATE"))
         END;;
    required_fields: [usage_metric_id]
    value_format: "#,##0.00"
    drill_fields: [org_project_breakdown*, usage_metric.usage_metric, monthly_value_project]
  }

  measure: count {
    type: count
    drill_fields: [org_project_breakdown*, count]
  }
}
