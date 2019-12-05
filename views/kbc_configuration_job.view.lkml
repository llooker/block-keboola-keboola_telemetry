view: kbc_configuration_job {
  sql_table_name: WORKSPACE_554682553.KBC_CONFIGURATION_JOB ;;
  drill_fields: [kbc_configuration_job_id]

  dimension: kbc_configuration_job_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_CONFIGURATION_JOB_ID" ;;
  }

  dimension: job_billed_credits_used {
    type: number
    sql: ${TABLE}."JOB_BILLED_CREDITS_USED" ;;
  }

  dimension: job_run_time_sec {
    type: number
    sql: ${TABLE}."JOB_RUN_TIME_SEC" ;;
  }

  dimension: job_run_type {
    type: string
    sql: ${TABLE}."JOB_RUN_TYPE" ;;
  }

  dimension_group: job_start {
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
    sql: ${TABLE}."JOB_START_AT" ;;
  }

  dimension: job_status {
    type: string
    sql: ${TABLE}."JOB_STATUS" ;;
  }

  dimension: job_time_credits_used {
    type: number
    sql: ${TABLE}."JOB_TIME_CREDITS_USED" ;;
  }

  dimension: job_volume_credits_used {
    type: number
    sql: ${TABLE}."JOB_VOLUME_CREDITS_USED" ;;
  }

  dimension: kbc_component_configuration_id {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION_ID" ;;
  }

  dimension: token_id {
    type: string
    sql: ${TABLE}."TOKEN_ID" ;;
  }

  dimension: token_name {
    type: string
    sql: ${TABLE}."TOKEN_NAME" ;;
  }

  measure: count {
    type: count
    drill_fields: [kbc_configuration_job_id, token_name]
  }
}
