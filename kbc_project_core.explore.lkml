explore: kbc_project_core {
  hidden: yes
  extension: required

  join: kbc_organization {
    type: left_outer
    sql_on: ${kbc_project.kbc_organization_id} = ${kbc_organization.kbc_organization_id} ;;
    relationship: many_to_one
  }
}
