#WhenDeployment: {
    event: "deployment"
    environment: string
}

#WhenPushMaster: {
    event: "push"
    branch: "master"
}

#WhenPushNotMaster: {
    event: "push"
    branch: exclude: "master"
}