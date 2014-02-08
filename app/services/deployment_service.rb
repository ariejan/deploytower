# Manages creating new deployments
class DeploymentService

  # Create a new deployment, if possible, for the
  # given target.
  # Returns a Deployment on success, otherwise nil
  def self.deploy!(target)
    if target.deployable?
      deployment = Deployment.create!({
        target:    target,
        branch:    target.git_default_branch,
        state:     'queued',
        reference: nil
      })

      queue_deployment(deployment)
    end

    deployment
  end

  # Enqueue an existing deployment for execution
  def self.queue_deployment(deployment)
    QC.enqueue('DeploymentOperation.perform', deployment.id)
  end
end

