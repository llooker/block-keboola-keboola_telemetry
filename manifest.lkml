project_name: "block-keboola-keboola_telemetry"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-keboola-keboola_telemetry-config"
  export: override_required
}

constant: CONNECTION {
  value: "keboola_block_keboola_telemetry_app"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "WORKSPACE_683361220"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }
}
