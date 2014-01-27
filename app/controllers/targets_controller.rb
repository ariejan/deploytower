class TargetsController < ApplicationController
  def index
    @targets = Target.all
  end
end
