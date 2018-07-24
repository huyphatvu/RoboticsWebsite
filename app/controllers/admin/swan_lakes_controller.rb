class Admin::SwanLakesController < Comfy::Admin::BaseController

  before_action :build_swan_lake,  only: [:new, :create]
  before_action :load_swan_lake,   only: [:show, :edit, :update, :destroy]

  def project
    @swan_lakes = SwanLake.all
  end

  def index
    @swan_lakes = SwanLake.order(:data_date).page(params[:page])
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
    @swan_lake.save!
    flash[:success] = 'Swan Lake created'
    redirect_to action: :show, id: @swan_lake
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Swan Lake'
    render action: :new
  end

  def update
    @swan_lake.update_attributes!(swan_lake_params)
    flash[:success] = 'Swan Lake updated'
    redirect_to action: :show, id: @swan_lake
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Swan Lake'
    render action: :edit
  end

  def destroy
    @swan_lake.destroy
    flash[:success] = 'Swan Lake deleted'
    redirect_to action: :index
  end

protected

  def build_swan_lake
    @swan_lake = SwanLake.new(swan_lake_params)
  end

  def load_swan_lake
    @swan_lake = SwanLake.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Swan Lake not found'
    redirect_to action: :index
  end

  def swan_lake_params
    params.fetch(:swan_lake, {}).permit(:data_date)
  end
end
