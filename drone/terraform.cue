#terraformVersion: "0.12.23"
#terraformImage: "jmccann/drone-terraform:6.3-0.12.20"
#terraformActionsPlan: ["validate", "plan"]
#terraformActionsApply: ["plan", "apply"]

#Terraform: #Step & {
  image: #terraformImage
  tf_version: #terraformVersion
  rootdir: string
  vars: {
    environment: string
    commit: "${DRONE_COMMIT_SHA:0:10}"
  }
  actions: [...string]
}