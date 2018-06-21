class Admin::SourceReferencesController < Comfy::Admin::BaseController

  before_action :build_source_reference,  only: [:new, :create]
  before_action :load_source_reference,   only: [:show, :edit, :update, :destroy]
  attr_accessor :source_reference

  def index
    @source_reference = SourceReference.all
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
    @source_reference.save!
    flash[:success] = 'Comfy Reference created'
    redirect_to action: :show, id: @comfy_reference
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Comfy Reference'
    render action: :new
  end

  def update
    @source_reference.update_attributes!(source_reference_params)
    flash[:success] = 'Comfy Reference updated'
    redirect_to action: :show, id: @source_reference
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Comfy Reference'
    render action: :edit
  end

  def destroy
    @source_reference.destroy
    flash[:success] = 'Comfy Reference deleted'
    redirect_to action: :index
  end

  protected

  def build_source_reference
    @source_reference = SourceReference.new(source_reference_params)
  end

  def load_source_reference
    @source_reference = SourceReference.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Comfy Reference not found'
    redirect_to action: :index
  end

  def source_reference_params
    params.fetch(:source_reference, {}).permit(:description)
  end
end
