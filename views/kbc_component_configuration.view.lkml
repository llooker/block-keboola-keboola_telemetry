view: kbc_component_configuration {
  label: "KBC Component Configuration"
  sql_table_name: KBC_COMPONENT_CONFIGURATION ;;

  dimension: kbc_component_configuration_id {
    label: "KBC Component Configuration ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION_ID" ;;
    html: <a href={{kbc_component_configuration.kbc_component_configuration_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: kbc_project_id {
    type: string
    hidden: yes
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
  }

  dimension: configuration_id {
    label: "Configuration ID"
    type: string
    sql: ${TABLE}."CONFIGURATION_ID" ;;
  }

  dimension: kbc_component_id {
    label: "KBC Component ID"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_ID" ;;
  }

  dimension: kbc_component {
    label: "KBC Component"
    type: string
    sql: ${TABLE}."KBC_COMPONENT" ;;
  }

  dimension: kbc_component_configuration {
    label: "KBC Component Configuration"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION" ;;
  }

  dimension: kbc_component_configuration_url {
    label: "KBC Component Configuration URL"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION_URL" ;;
  }

  dimension: kbc_component_listing {
    label: "KBC Component Listing"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_LISTING" ;;
  }

  dimension: kbc_component_origin {
    label: "KBC Component Origin"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_ORIGIN" ;;
  }

  dimension: kbc_component_type {
    label: "KBC Component Type"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_TYPE" ;;
  }

  dimension: kbc_component_vendor {
    label: "KBC Component Vendor"
    type: string
    sql: ${TABLE}."KBC_COMPONENT_VENDOR" ;;
  }

  dimension: kbc_configuration_is_deleted {
    label: "KBC Configuration Is Deleted"
    type: string
    sql: ${TABLE}."KBC_CONFIGURATION_IS_DELETED" ;;
  }

  dimension: kbc_configuration_version {
    label: "KBC Configuration Version"
    type: string
    sql: ${TABLE}."KBC_CONFIGURATION_VERSION" ;;
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

  measure: configurations {
    type: count
    drill_fields: [kbc_project.kbc_project, kbc_component, kbc_component_configuration, kbc_component_configuration_id]
  }

  measure: components {
    type: count_distinct
    sql: ${kbc_component_id} ;;
    drill_fields: [kbc_project.kbc_project, kbc_component, configurations]
  }

  measure: last_job_start {
    type: date
    sql: MAX(${kbc_configuration_job.job_start_raw}) ;;
  }
}
