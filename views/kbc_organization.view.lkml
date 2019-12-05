view: kbc_organization {
  sql_table_name: WORKSPACE_554682553.KBC_ORGANIZATION ;;
  drill_fields: [kbc_organization_id]

  dimension: kbc_organization_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION_ID" ;;
  }

  dimension: kbc_organization {
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION" ;;
  }

  dimension_group: kbc_organization_created {
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
    sql: ${TABLE}."KBC_ORGANIZATION_CREATED_AT" ;;
  }

  measure: count {
    type: count
    drill_fields: [kbc_organization_id, kbc_project.count]
  }
}
