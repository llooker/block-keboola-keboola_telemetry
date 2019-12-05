view: kbc_component_configuration {
  sql_table_name: WORKSPACE_554682553.KBC_COMPONENT_CONFIGURATION ;;
  drill_fields: [kbc_component_configuration_id]

  dimension: kbc_component_configuration_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION_ID" ;;
  }

  dimension: configuration_id {
    type: string
    sql: ${TABLE}."CONFIGURATION_ID" ;;
  }

  dimension: kbc_component {
    type: string
    sql: ${TABLE}."KBC_COMPONENT" ;;
  }

  dimension: kbc_component_configuration {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION" ;;
  }

  dimension: kbc_component_configuration_url {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_CONFIGURATION_URL" ;;
  }

  dimension: kbc_component_id {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_ID" ;;
  }

  dimension: kbc_component_listing {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_LISTING" ;;
  }

  dimension: kbc_component_origin {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_ORIGIN" ;;
  }

  dimension: kbc_component_type {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_TYPE" ;;
  }

  dimension: kbc_component_vendor {
    type: string
    sql: ${TABLE}."KBC_COMPONENT_VENDOR" ;;
  }

  dimension: kbc_configuration_is_deleted {
    type: string
    sql: ${TABLE}."KBC_CONFIGURATION_IS_DELETED" ;;
  }

  dimension: kbc_configuration_version {
    type: string
    sql: ${TABLE}."KBC_CONFIGURATION_VERSION" ;;
  }

  dimension: kbc_project_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
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
    drill_fields: [kbc_component_configuration_id, token_name, kbc_project.kbc_project_id]
  }
}
