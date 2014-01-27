class TargetsController < ApplicationController
  def index
    @targets = Target.all
  end

  def show
    @target = Target.find(params[:id])
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)

    if @target.save
      redirect_to @target
    else
      render :new
    end
  end

  private

  def target_params
    params.require(:target).permit(:name)
  end
end
