class Admin::SourceReferencesController < Comfy::Admin::BaseController

  before_action :build_source_reference,  only: [:new, :create]
  before_action :load_source_reference,   only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:index, :show]
  attr_accessor :source_reference, :cms_page

  def index
    # Use this for pagination
    # @source_reference = SourceReference.order(:text).page(params[:page]).per_page(10)

     @source_reference = SourceReference.all.order(:text)

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
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Comfy Reference'
    render action: :new
  end

  def update
    @source_reference.update_attributes!(source_reference_params)
    flash[:success] = 'Comfy Reference updated'
    redirect_to action: :index
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
    params.fetch(:source_reference, {}).permit(:text)
  end
end
