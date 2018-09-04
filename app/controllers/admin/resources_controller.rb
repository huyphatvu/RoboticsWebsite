class Admin::ResourcesController < Comfy::Admin::BaseController

  before_action :build_resource,  only: [:new, :create]
  before_action :load_resource,   only: [:show, :edit, :update, :destroy]

  def index
    @resources = Resource.page(params[:page])
  end

  def show
    render
  end

  def new
    render
  end

  def edit
    render
  end

  def create
    @resource.save!
    flash[:success] = 'Resource created'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Resource'
    render action: :new
  end

  def update
    @resource.update_attributes!(resource_params)
    flash[:success] = 'Resource updated'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Resource'
    render action: :edit
  end

  def destroy
    @resource.destroy
    flash[:success] = 'Resource deleted'
    redirect_to action: :index
  end

protected

  def build_resource
    @resource = Resource.new(resource_params)
  end

  def load_resource
    @resource = Resource.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Resource not found'
    redirect_to action: :index
  end

  def resource_params
    params.fetch(:resource, {}).permit(:experiment_name, :experiment_url)
  end
end
