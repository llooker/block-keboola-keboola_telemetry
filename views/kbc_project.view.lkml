view: kbc_project {
  sql_table_name: WORKSPACE_554682553.KBC_PROJECT ;;
  drill_fields: [kbc_project_id]

  dimension: kbc_project_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
  }

  dimension: kbc_organization_id {
    type: string
    # hidden: yes
    sql: ${TABLE}."KBC_ORGANIZATION_ID" ;;
  }

  dimension: kbc_project {
    type: string
    sql: ${TABLE}."KBC_PROJECT" ;;
  }

  dimension_group: kbc_project_created {
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
    sql: ${TABLE}."KBC_PROJECT_CREATED_AT" ;;
  }

  dimension_group: kbc_project_deleted {
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
    sql: ${TABLE}."KBC_PROJECT_DELETED_AT" ;;
  }

  dimension: kbc_project_is_deleted {
    type: string
    sql: ${TABLE}."KBC_PROJECT_IS_DELETED" ;;
  }

  dimension: kbc_project_type {
    type: string
    sql: ${TABLE}."KBC_PROJECT_TYPE" ;;
  }

  dimension: kbc_project_url {
    type: string
    sql: ${TABLE}."KBC_PROJECT_URL" ;;
  }

  measure: count {
    type: count
    drill_fields: [kbc_project_id, kbc_organization.kbc_organization_id, kbc_component_configuration.count, kbc_snowflake_stats.count, kbc_usage_metrics_values.count]
  }
}
