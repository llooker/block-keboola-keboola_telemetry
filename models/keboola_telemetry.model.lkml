connection: "keboola_block_keboola_telemetry"

# include all the views
include: "/views/**/*.view"

datagroup: keboola_telemetry_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: keboola_telemetry_default_datagroup

explore: contract_limit_monthly {
  label: "Contracts & Limits"

  join: usage_metric {
    type: left_outer
    sql_on: ${contract_limit_monthly.usage_metric_id} = ${usage_metric.usage_metric_id} ;;
    relationship: many_to_one
  }
}

explore: kbc_configuration_job {
  label: "KBC Configuration Job"
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

explore: kbc_project {
  label: "KBC Project"
  join: kbc_organization {
    type: left_outer
    sql_on: ${kbc_project.kbc_organization_id} = ${kbc_organization.kbc_organization_id} ;;
    relationship: many_to_one
  }
}

explore: kbc_snowflake_stats {
  label: "KBC Snowflake Stats"
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

explore: kbc_usage_metrics_values {
  label: "KBC Usage Metrics Values"
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
