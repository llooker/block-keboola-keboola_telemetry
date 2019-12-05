view: kbc_configuration_job {
  sql_table_name: KBC_CONFIGURATION_JOB ;;

  set: project_component_config {
    fields: [
      kbc_project.kbc_project,
      kbc_component_configuration.kbc_component,
      kbc_component_configuration.configuration_id,
      job_run_type
    ]
  }

  dimension: kbc_configuration_job_id {
    label: "KBC Configuration Job ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_CONFIGURATION_JOB_ID" ;;
  }

  dimension: kbc_component_configuration_id {
    hidden: yes
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION_ID" ;;
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

  dimension: job_run_type {
    type: string
    sql: ${TABLE}."JOB_RUN_TYPE" ;;
  }

  dimension: token_id {
    label: "Token ID"
    type: string
    sql: ${TABLE}."TOKEN_ID" ;;
  }

  dimension: token_name {
    label: "Token Name"
    type: string
    sql: ${TABLE}."TOKEN_NAME" ;;
  }

  dimension: job_billed_credits_used_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."JOB_BILLED_CREDITS_USED" ;;
  }

  dimension: job_time_credits_used_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."JOB_TIME_CREDITS_USED" ;;
  }

  dimension: job_volume_credits_used_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."JOB_VOLUME_CREDITS_USED" ;;
  }

  dimension: job_run_time_sec_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."JOB_RUN_TIME_SEC" ;;
  }

  measure: job_billed_credits_used {
    type: sum
    sql: ${job_billed_credits_used_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_billed_credits_used]
  }

  measure: job_time_credits_used {
    type: sum
    sql: ${job_time_credits_used_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_time_credits_used]
  }

  measure: job_volume_credits_used {
    type: sum
    sql: ${job_volume_credits_used_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_volume_credits_used]
  }

  measure: job_run_time_sec {
    type: sum
    sql: ${job_run_time_sec_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_run_time_sec]
  }

  measure: count {
    label: "Total Jobs"
    type: count
    drill_fields: [project_component_config*, job_start_date, count, job_billed_credits_used]
  }

  measure: error_jobs {
    type: count
    filters: {
      field: job_status
      value: "error"
    }
    drill_fields: [project_component_config*, job_start_date, error_jobs, job_billed_credits_used]
  }

  measure: successfull_jobs {
    type: count
    filters: {
      field: job_status
      value: "success"
    }
    drill_fields: [project_component_config*, job_start_date, error_jobs, job_billed_credits_used]
  }

  measure: error_ratio {
    label: "Error Ratio %"
    type: number
    sql: ${error_jobs}/${count} ;;
    value_format: "0%"
    drill_fields: [kbc_project.kbc_project, job_start_month, count, error_jobs, error_ratio]
  }
}
