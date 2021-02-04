kind: "pipeline"

#environments: ["dev", "stage", "prod"]
#terraformConfigurations: ["infra", "monitoring"]

pipeline: [string]:#Step

// WhenPushNotMaster: plan all environments for both service and monitoring
for target in #terraformConfigurations {
  for env in #environments 
  { 
    pipeline: "plan-terraform-\(target)-\(env)": #Terraform & {
      vars: environment: env
      rootdir: target
      actions: #terraformActionsPlan
      when: #WhenPushNotMaster
    }
  }
}

// WhenDeployment: apply to target environment for both service and monitoring
for target in #terraformConfigurations {
  for env in #environments 
  { 
    pipeline: "apply-\(target)-terraform-\(env)": #Terraform & {
      vars: environment: env
      rootdir: "monitoring"
      actions: #terraformActionsApply
      when: #WhenDeployment & { environment: env}
    }
  }
}