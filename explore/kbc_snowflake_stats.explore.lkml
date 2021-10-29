include: "/views/*.view.lkml"

explore: kbc_snowflake_stats {


  join: kbc_project {
    type: left_outer
    sql_on: ${kbc_snowflake_stats.kbc_project_id} = ${kbc_project.kbc_project_id} ;;
    relationship: many_to_one
  }

  join: kbc_organization {
    type: left_outer
    sql_on: ${kbc_project.kbc_organization_id} = ${kbc_organization.kbc_organization_id} ;;
    relationship: many_to_one
  }
}
