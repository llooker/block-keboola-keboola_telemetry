view: usage_metric {
  sql_table_name: WORKSPACE_554682553.USAGE_METRIC ;;
  drill_fields: [usage_metric_id]

  dimension: usage_metric_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."USAGE_METRIC_ID" ;;
  }

  dimension: metric_group {
    type: string
    sql: ${TABLE}."METRIC_GROUP" ;;
  }

  dimension: metric_group_orderby {
    type: string
    sql: ${TABLE}."METRIC_GROUP_ORDERBY" ;;
  }

  dimension: metric_type {
    type: string
    sql: ${TABLE}."METRIC_TYPE" ;;
  }

  dimension: usage_metric {
    type: string
    sql: ${TABLE}."USAGE_METRIC" ;;
  }

  measure: count {
    type: count
    drill_fields: [usage_metric_id, contract_limit_monthly.count, kbc_usage_metrics_values.count]
  }
}
