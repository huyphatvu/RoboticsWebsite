require_relative '../../test_helper'

class Admin::ResourcesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @resource = resources(:default)
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
    r :get, admin_resources_path
    assert_response :success
    assert assigns(:resources)
    assert_template :index
  end

  def test_get_show
    r :get, admin_resource_path(@resource)
    assert_response :success
    assert assigns(:resource)
    assert_template :show
  end

  def test_get_show_failure
    r :get, admin_resource_path('invalid')
    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal 'Resource not found', flash[:danger]
  end

  def test_get_new
    r :get, new_admin_resource_path
    assert_response :success
    assert assigns(:resource)
    assert_template :new
    assert_select "form[action='/admin/resources']"
  end

  def test_get_edit
    r :get, edit_admin_resource_path(@resource)
    assert_response :success
    assert assigns(:resource)
    assert_template :edit
    assert_select "form[action='/admin/resources/#{@resource.id}']"
  end

  def test_creation
    assert_difference 'Resource.count' do
      r :post, admin_resources_path, params: {resource: {
        experiment_name: 'test experiment_name',
        experiment_url: 'test experiment_url',
      }}
      resource = Resource.last
      assert_response :redirect
      assert_redirected_to action: :show, id: resource
      assert_equal 'Resource created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'Resource.count' do
      r :post, admin_resources_path, params: {resource: { }}
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Resource', flash[:danger]
    end
  end

  def test_update
    r :put, admin_resource_path(@resource), params: {resource: {
      experiment_name: 'Updated'
    }}
    assert_response :redirect
    assert_redirected_to action: :show, id: @resource
    assert_equal 'Resource updated', flash[:success]
    @resource.reload
    assert_equal 'Updated', @resource.experiment_name
  end

  def test_update_failure
    r :put, admin_resource_path(@resource), params: {resource: {
      experiment_name: ''
    }}
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Resource', flash[:danger]
    @resource.reload
    refute_equal '', @resource.experiment_name
  end

  def test_destroy
    assert_difference 'Resource.count', -1 do
      r :delete, admin_resource_path(@resource)
      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal 'Resource deleted', flash[:success]
    end
  end
end
