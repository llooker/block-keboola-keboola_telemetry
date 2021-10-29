
view: kbc_organization {
  sql_table_name: @{SCHEMA_NAME}.KBC_ORGANIZATION ;;

  dimension: kbc_organization_id {
    label: "KBC Organization ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION_ID" ;;
    html: <a href={{kbc_organization.kbc_organization_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: kbc_organization {
    label: "KBC Organization"
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION" ;;
    html: <a href={{kbc_organization.kbc_organization_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: kbc_organization_url {
    label: "KBC Organization URL"
    type: string
    sql: ${TABLE}."KBC_ORGANIZATION_URL" ;;
  }

  dimension: kbc_region {
    label: "KBC Region"
    type: string
    sql: ${TABLE}."KBC_REGION" ;;
  }

  dimension: kbc_cloud {
    label: "KBC Cloud"
    type: string
    sql: ${TABLE}."KBC_CLOUD" ;;
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
    drill_fields: [kbc_organization, kbc_organization_id, kbc_project.count]
  }
}
