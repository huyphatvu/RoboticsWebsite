require_relative '../../test_helper'

class Admin::ParticipantsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @participant = participants(:default)
  end

  # Vanilla CMS has BasicAuth, so we need to send that with each request.
  # Change this to fit your app's authentication strategy.
  # Move this to test_helper.rb
  def r(verb, path, options = {})
    headers = options[:headers] || {}
    headers['HTTP_AUTHORIZATION'] =
      ActionController::HttpAuthentication::Basic.encode_credentials(
        ComfortableMexicanSofa::AccessControl::AdminAuthentication.username,
        ComfortableMexicanSofa::AccessControl::AdminAuthentication.password
      )
    options.merge!(headers: headers)
    send(verb, path, options)
  end

  def test_get_index
    r :get, admin_participants_path
    assert_response :success
    assert assigns(:participants)
    assert_template :index
  end

  def test_get_show
    r :get, admin_participant_path(@participant)
    assert_response :success
    assert assigns(:participant)
    assert_template :show
  end

  def test_get_show_failure
    r :get, admin_participant_path('invalid')
    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal 'Participant not found', flash[:danger]
  end

  def test_get_new
    r :get, new_admin_participant_path
    assert_response :success
    assert assigns(:participant)
    assert_template :new
    assert_select "form[action='/admin/participants']"
  end

  def test_get_edit
    r :get, edit_admin_participant_path(@participant)
    assert_response :success
    assert assigns(:participant)
    assert_template :edit
    assert_select "form[action='/admin/participants/#{@participant.id}']"
  end

  def test_creation
    assert_difference 'Participant.count' do
      r :post, admin_participants_path, params: {participant: {
        fullname: 'test fullname',
        email: 'test email',
        state: 'test state',
      }}
      participant = Participant.last
      assert_response :redirect
      assert_redirected_to action: :show, id: participant
      assert_equal 'Participant created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'Participant.count' do
      r :post, admin_participants_path, params: {participant: { }}
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Participant', flash[:danger]
    end
  end

  def test_update
    r :put, admin_participant_path(@participant), params: {participant: {
      fullname: 'Updated'
    }}
    assert_response :redirect
    assert_redirected_to action: :show, id: @participant
    assert_equal 'Participant updated', flash[:success]
    @participant.reload
    assert_equal 'Updated', @participant.fullname
  end

  def test_update_failure
    r :put, admin_participant_path(@participant), params: {participant: {
      fullname: ''
    }}
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Participant', flash[:danger]
    @participant.reload
    refute_equal '', @participant.fullname
  end

  def test_destroy
    assert_difference 'Participant.count', -1 do
      r :delete, admin_participant_path(@participant)
      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal 'Participant deleted', flash[:success]
    end
  end
end
