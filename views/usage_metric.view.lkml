view: usage_metric {
  sql_table_name: USAGE_METRIC ;;

  dimension: usage_metric_id {
    label: "Usage Metric ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."USAGE_METRIC_ID" ;;
  }

  dimension: metric_group {
    type: string
    sql: ${TABLE}."METRIC_GROUP" ;;
    order_by_field: metric_group_orderby
  }

  dimension: metric_group_orderby {
    hidden: yes
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
    drill_fields: [usage_metric_id, contract_limit_monthly.count, usage_metric_values.count]
  }
}
