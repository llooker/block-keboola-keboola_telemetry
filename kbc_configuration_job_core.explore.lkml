explore: kbc_configuration_job_core {
  hidden: yes
  extension: required

  join: kbc_component_configuration {
    type: left_outer
    sql_on: ${kbc_configuration_job.kbc_component_configuration_id}=${kbc_component_configuration.kbc_component_configuration_id} ;;
    relationship: many_to_one
  }

  join: kbc_project {
    type: left_outer
    sql_on: ${kbc_component_configuration.kbc_project_id}=${kbc_project.kbc_project_id} ;;
    relationship: many_to_one
  }

  join: kbc_organization {
    type: left_outer
    sql_on: ${kbc_project.kbc_organization_id}=${kbc_organization.kbc_organization_id} ;;
    relationship: many_to_one
  }
}
