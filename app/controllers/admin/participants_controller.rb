class Admin::ParticipantsController < Comfy::Admin::BaseController

  before_action :build_participant,  only: [:new, :create]
  before_action :load_participant,   only: [:show, :edit, :update, :destroy]

  def index
    @participants = Participant.order(:state_name).page(params[:page])
    # @participants = joinParticipant
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
    @participant.save!
    flash[:success] = 'Participant created'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to create Participant'
    render action: :new
  end

  def update

    @participant.update_attributes!(participant_params)
    flash[:success] = 'Participant updated'
    redirect_to action: :index
  rescue ActiveRecord::RecordInvalid
    flash.now[:danger] = 'Failed to update Participant'
    render action: :edit
  end

  def destroy
    @participant.destroy
    flash[:success] = 'Participant deleted'
    redirect_to action: :index
  end

protected

  def build_participant
    # byebug
    @participant = Participant.new(participant_params)
  end

  def load_participant
    @participant = Participant.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Participant not found'
    redirect_to action: :index
  end

  def participant_params
    # Change the param statename to capitalized and striped bf save to database
    if params[:participant] #make sure participants not null
      state_name = params[:participant][:state_name]
      params[:participant][:state_name] = state_name.to_s.strip.capitalize
    end
    params.fetch(:participant, {}).permit(:first_name, :last_name, :email, :state_name)
  end
end
