# Deployment represents the state of
# a queued or finished deployment for
# the specified target.
class Deployment < ActiveRecord::Base

  belongs_to :target

  def queued?
    state == 'queued'
  end

  def deploying!
    update(state: 'deploying')
  end

  def finished!
    update(state: 'finished')
  end
end
