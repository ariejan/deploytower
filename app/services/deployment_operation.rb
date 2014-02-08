class DeploymentOperation
  def self.perform(deployment_id)
    deployment = Deployment.find(deployment_id)
    deployment.deploying!
  end
end
