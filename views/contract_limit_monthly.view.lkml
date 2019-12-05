view: contract_limit_monthly {
  sql_table_name: WORKSPACE_554682553.CONTRACT_LIMIT_MONTHLY ;;

  dimension: company_id {
    type: string
    sql: ${TABLE}."COMPANY_ID" ;;
  }

  dimension: contract {
    type: string
    sql: ${TABLE}."CONTRACT" ;;
  }

  dimension: contract_id {
    type: string
    sql: ${TABLE}."CONTRACT_ID" ;;
  }

  dimension: contract_usage_date_id {
    type: string
    sql: ${TABLE}."CONTRACT_USAGE_DATE_ID" ;;
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

  dimension: limit_value {
    type: number
    sql: ${TABLE}."LIMIT_VALUE" ;;
  }

  dimension: usage_metric_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."USAGE_METRIC_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [usage_metric.usage_metric_id]
  }
}
