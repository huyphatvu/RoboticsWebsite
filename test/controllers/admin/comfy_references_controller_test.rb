require_relative '../../test_helper'

class Admin::ComfyReferencesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @comfy_reference = comfy_references(:default)
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
    r :get, admin_comfy_references_path
    assert_response :success
    assert assigns(:comfy_references)
    assert_template :index
  end

  def test_get_show
    r :get, admin_comfy_reference_path(@comfy_reference)
    assert_response :success
    assert assigns(:comfy_reference)
    assert_template :show
  end

  def test_get_show_failure
    r :get, admin_comfy_reference_path('invalid')
    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal 'Comfy Reference not found', flash[:danger]
  end

  def test_get_new
    r :get, new_admin_comfy_reference_path
    assert_response :success
    assert assigns(:comfy_reference)
    assert_template :new
    assert_select "form[action='/admin/comfy_references']"
  end

  def test_get_edit
    r :get, edit_admin_comfy_reference_path(@comfy_reference)
    assert_response :success
    assert assigns(:comfy_reference)
    assert_template :edit
    assert_select "form[action='/admin/comfy_references/#{@comfy_reference.id}']"
  end

  def test_creation
    assert_difference 'ComfyReference.count' do
      r :post, admin_comfy_references_path, params: {comfy_reference: {
        description: 'test description',
      }}
      comfy_reference = ComfyReference.last
      assert_response :redirect
      assert_redirected_to action: :show, id: comfy_reference
      assert_equal 'Comfy Reference created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'ComfyReference.count' do
      r :post, admin_comfy_references_path, params: {comfy_reference: { }}
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Comfy Reference', flash[:danger]
    end
  end

  def test_update
    r :put, admin_comfy_reference_path(@comfy_reference), params: {comfy_reference: {
      description: 'Updated'
    }}
    assert_response :redirect
    assert_redirected_to action: :show, id: @comfy_reference
    assert_equal 'Comfy Reference updated', flash[:success]
    @comfy_reference.reload
    assert_equal 'Updated', @comfy_reference.description
  end

  def test_update_failure
    r :put, admin_comfy_reference_path(@comfy_reference), params: {comfy_reference: {
      description: ''
    }}
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Comfy Reference', flash[:danger]
    @comfy_reference.reload
    refute_equal '', @comfy_reference.description
  end

  def test_destroy
    assert_difference 'ComfyReference.count', -1 do
      r :delete, admin_comfy_reference_path(@comfy_reference)
      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal 'Comfy Reference deleted', flash[:success]
    end
  end
end
