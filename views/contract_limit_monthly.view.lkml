view: contract_limit_monthly {
  sql_table_name: @{SCHEMA_NAME}.CONTRACT_LIMIT_MONTHLY ;;

  dimension: contract_usage_date_id {
    label: "Contract Limit Monthly ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."CONTRACT_LIMIT_MONTHLY_ID" ;;
  }

  dimension: usage_metric_id {
    type: string
    hidden: yes
    sql: ${TABLE}."USAGE_METRIC_ID" ;;
  }

  dimension: contract_id {
    label: "Contract ID"
    type: string
    sql: ${TABLE}."CONTRACT_ID" ;;
  }

  dimension: limit_type {
    type: string
    sql: ${TABLE}."LIMIT_TYPE" ;;
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
    sql: ${TABLE}."DATE" ;;
  }

  dimension: limit_value_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."LIMIT_VALUE" ;;
  }

  measure: limit_value {
    type: sum
    sql: ${limit_value_dimension} ;;
    value_format: "#,##0"
  }
}
