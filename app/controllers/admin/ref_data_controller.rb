class Admin::RefDataController < Comfy::Admin::BaseController

  before_action :build_ref_data,  only: [:new, :create]
  before_action :load_ref_data,   only: [:show, :edit, :update, :destroy]

  def index
    @ref_data = RefData.page(params[:page])
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
    @ref_data.save!
    flash[:success] = 'Ref Data created'
    redirect_to action: :show, id: @ref_data
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Ref Data'
    render action: :new
  end

  def update
    @ref_data.update_attributes!(ref_data_params)
    flash[:success] = 'Ref Data updated'
    redirect_to action: :show, id: @ref_data
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Ref Data'
    render action: :edit
  end

  def destroy
    @ref_data.destroy
    flash[:success] = 'Ref Data deleted'
    redirect_to action: :index
  end

protected

  def build_ref_data
    @ref_data = RefData.new(ref_data_params)
  end

  def load_ref_data
    @ref_data = RefData.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Ref Data not found'
    redirect_to action: :index
  end

  def ref_data_params
    params.fetch(:ref_data, {}).permit(:page_num, :label)
  end
end
