class Admin::ComfyReferencesController < Comfy::Admin::BaseController

  before_action :build_comfy_reference,  only: [:new, :create]
  before_action :load_comfy_reference,   only: [:show, :edit, :update, :destroy]

  def index
    @comfy_references = ComfyReference.page(params[:page])
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
    @comfy_reference.save!
    flash[:success] = 'Comfy Reference created'
    redirect_to action: :show, id: @comfy_reference
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Comfy Reference'
    render action: :new
  end

  def update
    @comfy_reference.update_attributes!(comfy_reference_params)
    flash[:success] = 'Comfy Reference updated'
    redirect_to action: :show, id: @comfy_reference
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Comfy Reference'
    render action: :edit
  end

  def destroy
    @comfy_reference.destroy
    flash[:success] = 'Comfy Reference deleted'
    redirect_to action: :index
  end

protected

  def build_comfy_reference
    @comfy_reference = ComfyReference.new(comfy_reference_params)
  end

  def load_comfy_reference
    @comfy_reference = ComfyReference.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Comfy Reference not found'
    redirect_to action: :index
  end

  def comfy_reference_params
    params.fetch(:comfy_reference, {}).permit(:description)
  end
end
