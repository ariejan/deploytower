# Deployment represents the state of
# a queued or finished deployment for
# the specified target.
class Deployment < ActiveRecord::Base
  include AASM

  belongs_to :target

  aasm column: :state do
    state :queued, initial: true
    state :finished
  end
end
