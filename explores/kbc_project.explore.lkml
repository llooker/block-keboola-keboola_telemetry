include: "/views/kbc_project.view.lkml"
include: "/views/kbc_organization.view.lkml"

explore: kbc_project {

  join: kbc_organization {
    type: left_outer
    sql_on: ${kbc_project.kbc_organization_id} = ${kbc_organization.kbc_organization_id} ;;
    relationship: many_to_one
  }
}
