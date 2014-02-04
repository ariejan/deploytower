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

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])

    if @target.update(target_params)
      redirect_to @target
    else
      render :edit
    end
  end

  def destroy
    @target = Target.find(params[:id])
    @target.destroy

    redirect_to root_path
  end

  private

  def target_params
    params.require(:target).permit(:name, :heroku_app_name, :heroku_git_remote, :git_remote, :git_default_branch, :url)
  end
end
