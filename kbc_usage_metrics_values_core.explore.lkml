explore: kbc_usage_metrics_values_core {
  hidden: yes
  extension: required

  join: usage_metric {
    type: left_outer
    sql_on: ${kbc_usage_metrics_values.usage_metric_id} = ${usage_metric.usage_metric_id} ;;
    relationship: many_to_one
  }

  join: kbc_project {
    type: left_outer
    sql_on: ${kbc_usage_metrics_values.kbc_project_id} = ${kbc_project.kbc_project_id} ;;
    relationship: many_to_one
  }

  join: kbc_organization {
    type: left_outer
    sql_on: ${kbc_project.kbc_organization_id} = ${kbc_organization.kbc_organization_id} ;;
    relationship: many_to_one
  }
}
