view: kbc_usage_metrics_values {
  sql_table_name: WORKSPACE_554682553.KBC_USAGE_METRICS_VALUES ;;

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

  dimension: kbc_project_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
  }

  dimension: metrics_values_id {
    type: string
    sql: ${TABLE}."METRICS_VALUES_ID" ;;
  }

  dimension: organization_value {
    type: number
    sql: ${TABLE}."ORGANIZATION_VALUE" ;;
  }

  dimension: usage_breakdown {
    type: string
    sql: ${TABLE}."USAGE_BREAKDOWN" ;;
  }

  dimension: usage_metric_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."USAGE_METRIC_ID" ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}."VALUE" ;;
  }

  measure: count {
    type: count
    drill_fields: [usage_metric.usage_metric_id, kbc_project.kbc_project_id]
  }
}
