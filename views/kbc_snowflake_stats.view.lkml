view: kbc_snowflake_stats {
  sql_table_name: WORKSPACE_554682553.KBC_SNOWFLAKE_STATS ;;

  dimension: dwh_size {
    type: string
    sql: ${TABLE}."DWH_SIZE" ;;
  }

  dimension: kbc_project_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
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

  dimension: snowflake_queries {
    type: number
    sql: ${TABLE}."SNOWFLAKE_QUERIES" ;;
  }

  dimension: snowflake_queries_credits {
    type: number
    sql: ${TABLE}."SNOWFLAKE_QUERIES_CREDITS" ;;
  }

  dimension: snowflake_queries_lenght_s {
    type: number
    sql: ${TABLE}."SNOWFLAKE_QUERIES_LENGHT_S" ;;
  }

  dimension: snowflake_schema_name {
    type: string
    sql: ${TABLE}."SNOWFLAKE_SCHEMA_NAME" ;;
  }

  dimension: snowflake_user_name {
    type: string
    sql: ${TABLE}."SNOWFLAKE_USER_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [snowflake_db_name, snowflake_schema_name, snowflake_user_name, kbc_project.kbc_project_id]
  }
}
