class Target < ActiveRecord::Base

  default_scope { order('name ASC') }

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
