view: kbc_snowflake_stats {
  label: "KBC Snowflake Stats"
  sql_table_name: KBC_SNOWFLAKE_STATS ;;

  dimension: kbc_snowflake_stats_id {
    label: "KBC Snowflake Stats ID"
    type:  string
    sql: md5(${TABLE}."DWH_SIZE"||'_'||${TABLE}."SNOWFLAKE_JOB_START_AT"||'_'||${TABLE}."KBC_PROJECT_ID"||'_'||${TABLE}."SNOWFLAKE_DB_NAME"||'_'||${TABLE}."SNOWFLAKE_JOB_RESULT"||'_'||${TABLE}."SNOWFLAKE_JOB_TYPE"||'_'||${TABLE}."SNOWFLAKE_SCHEMA_NAME"||'_'||${TABLE}."SNOWFLAKE_USER_NAME") ;;
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
    type: string
    sql: ${TABLE}."SNOWFLAKE_DB_NAME" ;;
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
    type: string
    sql: ${TABLE}."SNOWFLAKE_SCHEMA_NAME" ;;
  }

  dimension: snowflake_user_name {
    type: string
    sql: ${TABLE}."SNOWFLAKE_USER_NAME" ;;
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
    sql: ${TABLE}."SNOWFLAKE_QUERIES_CREDITS" ;;
  }

  measure: snowflake_queries {
    label: "Snowflake Queries"
    type: sum
    sql: ${snowflake_queries_dimension} ;;
    filters: {
      field: snowflake_job_type
      value: "dwhm, writer"
    }
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
    drill_fields: [kbc_project.kbc_project, snowflake_job_type, snowflake_job_start_date, snowflake_queries_length_h ,snowflake_queries]
  }

  measure: snowflake_queries_credits {
    type: sum
    sql: ${snowflake_queries_credits_dimension} ;;
    value_format: "#,##0.00"
  }

  measure: count {
    type: count
    drill_fields: [snowflake_db_name, snowflake_schema_name, snowflake_user_name, kbc_project.kbc_project_id]
  }
}
