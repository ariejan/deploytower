class DeploymentOperation
  def self.perform(deployment_id)
    deployment = Deployment.find(deployment_id)
    DeploymentOperation.new(deployment).perform
  end

  attr_reader :deployment

  def initialize(deployment)
    @deployment = deployment
  end

  def perform
    deployment.deploying!

    # TODO: Implement actual deployment

    deployment.finished!
  end
end
