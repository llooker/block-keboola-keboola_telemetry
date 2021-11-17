include: "/views/contract_limit_monthly.view"
include: "/views/usage_metric.view"

explore: contract_limit_monthly {

  join: usage_metric {
    type: left_outer
    sql_on: ${contract_limit_monthly.usage_metric_id} = ${usage_metric.usage_metric_id} ;;
    relationship: many_to_one
  }
}
