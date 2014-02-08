# The Target class stores information regarding
# deployment targets.
#
# A target consists of information regarding a
# possible deployment:
#
#  * Details of the Heroku app to which new
#    deployments will go.
#  * Details of the git repository where we fetch
#    our code from.
#  * URL where the app can be accessed after
#    deployment
#
class Target < ActiveRecord::Base
  # Queues a new Deployment for this target.
  def deploy!
    DeploymentService.deploy!(self)
  end

  # Returns true if new deployments for this
  # target are allowed to be queued.
  def deployable?
    deployments.none? { |d| d.queued? }
  end

  default_scope { order('name ASC') }

  has_many :deployments

  validates :name,
            presence: true

  validates :heroku_app_name,
            presence: true

  validates :heroku_git_remote,
            presence: true

  validates :git_remote,
            presence: true

  validates :git_default_branch,
            presence: true

  validates :url,
            presence: true
end
