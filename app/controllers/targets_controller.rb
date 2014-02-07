# Managed CRUD operations for Target
#
# This controller does not handle deployments.
class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy, :deploy]

  # GET /targets
  def index
    @targets = Target.all
  end

  # GET /targets/1
  def show
    @deployments = DeploymentDecorator.decorate_collection(@target.deployments)
  end

  # GET /targets/new
  def new
    @target = Target.new
  end

  # GET /targets/1/edit
  def edit
  end

  # POST /targets
  def create
    @target = Target.new(target_params)

    if @target.save
      redirect_to @target,
        flash: { success: 'Target was successfully created.' }
    else
      render :new
    end
  end

  # PATCH/PUT /targets/1
  def update
    if @target.update(target_params)
      redirect_to @target,
        flash: { success: 'Target was successfully updated.' }
    else
      render :edit
    end
  end

  # DELETE /targets/1
  def destroy
    @target.destroy
    redirect_to root_path,
      flash: { success: 'Target was successfully deleted.' }
  end

  # POST /targets/1/deploy
  def deploy
    if  @target.deploy!
      redirect_to @target,
        flash: { success: 'Deployment queued successfully' }
    else
      redirect_to @target,
        flash: { error: 'Deployment cannot be queued' }
    end
  end

  private

  def set_target
    @target = Target.find(params[:id])
  end

  def target_params
    params.require(:target).permit(
      :name, :heroku_app_name, :heroku_git_remote,
      :git_remote, :git_default_branch, :url)
  end
end
