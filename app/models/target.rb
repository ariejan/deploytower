class Target < ActiveRecord::Base

  default_scope { order('name ASC') }

  validates :name,
    presence: true
end
