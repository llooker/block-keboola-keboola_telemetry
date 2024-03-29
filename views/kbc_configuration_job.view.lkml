view: kbc_configuration_job {
  sql_table_name: @{SCHEMA_NAME}.KBC_JOB ;;

  set: project_component_config {
    fields: [
      kbc_project.kbc_project,
      kbc_component_configuration.kbc_component,
      transformation_type,
      kbc_component_configuration.configuration_id,
      job_run_type
    ]
  }

  dimension: kbc_configuration_job_id {
    label: "KBC Job ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_JOB_ID" ;;
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

  dimension: ds_backend_size {
    description: "Defines if and what boosted Data Science (R/Python) backend was used for the job."
    type: string
    sql: ${TABLE}."DS_BACKEND_SIZE" ;;
  }

  dimension: transformation_type {
    type: string
    sql: ${TABLE}."TRANSFORMATION_TYPE" ;;
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

  dimension: job_run_time_sec_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."JOB_RUN_TIME_SEC" ;;
  }

  dimension: dwh_small_ratio_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."DWH_SMALL_RATIO" ;;
  }

  dimension: dwh_medium_ratio_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."DWH_MEDIUM_RATIO" ;;
  }

  dimension: dwh_large_ratio_dimension {
    hidden: yes
    type: number
    sql: ${TABLE}."DWH_LARGE_RATIO" ;;
  }

  measure: job_billed_credits_used {
    description: "Number of consumed billed credits (credits consuming the contract limits)."
    type: sum
    sql: ${job_billed_credits_used_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_billed_credits_used, count]
  }

  measure: job_time_credits_used {
    description: "Number of time credits used (all time credits are not billed as well)."
    type: sum
    sql: ${job_time_credits_used_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_time_credits_used, count]
  }

  measure: job_run_time_sec {
    type: sum
    sql: ${job_run_time_sec_dimension} ;;
    value_format: "#,##0.00"
    drill_fields: [project_component_config*, job_run_time_sec, count]
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
    html: {{ rendered_value }} Error Ratio | {{ count._rendered_value }} Jobs;;
    value_format: "0.00%"
    drill_fields: [kbc_project.kbc_project, job_start_month, count, error_jobs, error_ratio]
  }

  measure: dwh_small_ratio {
    label: "DWH Small Ratio"
    description: "Defines how big portion of the SQL transformation job run on Small Datawarehouse."
    type: average
    sql: ${dwh_small_ratio_dimension} ;;
  }

  measure: dwh_medium_ratio {
    label: "DWH Medium Ratio"
    description: "Defines how big portion of the SQL transformation job run on Medium Datawarehouse."
    type: average
    sql: ${dwh_medium_ratio_dimension} ;;
  }

  measure: dwh_large_ratio {
    label: "DWH Large Ratio"
    description: "Defines how big portion of the SQL transformation job run on Large Datawarehouse."
    type: average
    sql: ${dwh_large_ratio_dimension} ;;
  }

  measure: tokens {
    type: count_distinct
    sql: ${token_name} ;;
    drill_fields: [kbc_project.kbc_project, token_name, count]
  }
}
