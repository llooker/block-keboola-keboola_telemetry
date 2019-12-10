view: kbc_project {
  label: "KBC Project"
  sql_table_name: KBC_PROJECT ;;

  dimension: kbc_project_id {
    label: "KBC Project ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_PROJECT_ID" ;;
    html: <a href={{kbc_project.kbc_project_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: kbc_organization_id {
    type: string
    hidden: yes
    sql: ${TABLE}."KBC_ORGANIZATION_ID" ;;
  }

  dimension: kbc_project {
    label: "KBC Project"
    type: string
    sql: ${TABLE}."KBC_PROJECT" ;;
    html: <a href={{kbc_project.kbc_project_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: kbc_project_url {
    label: "KBC Project URL"
    type: string
    sql: ${TABLE}."KBC_PROJECT_URL" ;;
  }

  dimension_group: kbc_project_created {
    label: "KBC Project Created"
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
    label: "KBC Project Deleted"
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
    label: "KBC Project Is Deleted"
    type: string
    sql: ${TABLE}."KBC_PROJECT_IS_DELETED" ;;
  }

  dimension: kbc_project_type {
    label: "KBC Project Type"
    type: string
    sql: ${TABLE}."KBC_PROJECT_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [kbc_organization.kbc_organization, kbc_project_id, kbc_component_configuration.count, kbc_snowflake_stats.count, kbc_usage_metrics_values.count]
  }
}
