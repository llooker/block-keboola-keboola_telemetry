view: kbc_snowflake_stats {
  sql_table_name: @{SCHEMA_NAME}.KBC_SNOWFLAKE_STATS ;;

  set: project_type_date {
    fields: [
      kbc_project.kbc_project,
      snowflake_job_type,
      snowflake_job_start_date
      ]
  }

  dimension: kbc_snowflake_stats_id {
    label: "KBC Snowflake Stats ID"
    type:  string
    sql: md5(concat(${TABLE}."DWH_SIZE", '_', ${TABLE}."SNOWFLAKE_DWH", '_', ${TABLE}."SNOWFLAKE_JOB_START_AT", '_', ${TABLE}."KBC_PROJECT_ID", '_', ${TABLE}."SNOWFLAKE_DATABASE", '_', ${TABLE}."SNOWFLAKE_JOB_RESULT", '_', ${TABLE}."SNOWFLAKE_JOB_TYPE", '_', ${TABLE}."SNOWFLAKE_SCHEMA", '_', ${TABLE}."SNOWFLAKE_USER")) ;;
    hidden: yes
    primary_key: yes
  }

  dimension: kbc_project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
  }

  dimension: dwh_size {
    label: "DWH Size"
    type: string
    sql: ${TABLE}."DWH_SIZE" ;;
  }

  dimension: snowflake_db_name {
    label: "Snowflake Database"
    type: string
    sql: ${TABLE}."SNOWFLAKE_DATABASE" ;;
  }

  dimension: snowflake_dwh {
    label: "Snowflake DWH"
    type: string
    sql: ${TABLE}."SNOWFLAKE_DWH" ;;
  }

  dimension: snowflake_job_result {
    type: string
    sql: ${TABLE}."SNOWFLAKE_JOB_RESULT" ;;
  }

  dimension_group: snowflake_job_start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SNOWFLAKE_JOB_START_AT" ;;
  }

  dimension: snowflake_job_type {
    type: string
    sql: ${TABLE}."SNOWFLAKE_JOB_TYPE" ;;
  }

  dimension: snowflake_schema_name {
    label: "Snowflake Schema"
    type: string
    sql: ${TABLE}."SNOWFLAKE_SCHEMA" ;;
  }

  dimension: snowflake_user_name {
    label: "Snowflake User"
    type: string
    sql: ${TABLE}."SNOWFLAKE_USER" ;;
  }

  dimension: snowflake_queries_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."SNOWFLAKE_QUERIES" ;;
  }

  dimension: snowflake_queries_length_h_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."SNOWFLAKE_QUERIES_LENGTH_S"/3600 ;;
  }

  dimension: snowflake_queries_credits_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."BILLED_CREDITS_USED" ;;
  }

  dimension: time_credits_used_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."TIME_CREDITS_USED" ;;
  }

  measure: snowflake_queries {
    label: "Snowflake Queries"
    type: sum
    sql: ${snowflake_queries_dimension} ;;
    filters: {
      field: snowflake_job_type
      value: "dwhm, writer"
    }
    drill_fields: [project_type_date*, snowflake_queries]
  }

  measure: snowflake_queries_length_h {
    label: "KBC Elapsed Hours"
    type: sum
    sql: ${snowflake_queries_length_h_dimension} ;;
    filters: {
      field: snowflake_job_type
      value: "dwhm, writer"
    }
    value_format: "#,##0.00"
    drill_fields: [project_type_date*, snowflake_queries_length_h, snowflake_queries]
  }

  measure: snowflake_queries_credits {
    label: "Billed Credits Used"
    type: sum
    sql: ${snowflake_queries_credits_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_type_date*, snowflake_queries_credits]
  }

  measure: time_credits_used {
    label: "Time Credits Used"
    type: sum
    sql: ${time_credits_used_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_type_date*, time_credits_used]
  }

  measure: count {
    type: count
    drill_fields: [project_type_date*, count]
  }
}
