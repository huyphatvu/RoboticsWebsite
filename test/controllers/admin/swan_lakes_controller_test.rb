require_relative '../../test_helper'

class Admin::SwanLakesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @swan_lake = swan_lakes(:default)
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
    r :get, admin_swan_lakes_path
    assert_response :success
    assert assigns(:swan_lakes)
    assert_template :index
  end

  def test_get_show
    r :get, admin_swan_lake_path(@swan_lake)
    assert_response :success
    assert assigns(:swan_lake)
    assert_template :show
  end

  def test_get_show_failure
    r :get, admin_swan_lake_path('invalid')
    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal 'Swan Lake not found', flash[:danger]
  end

  def test_get_new
    r :get, new_admin_swan_lake_path
    assert_response :success
    assert assigns(:swan_lake)
    assert_template :new
    assert_select "form[action='/admin/swan_lakes']"
  end

  def test_get_edit
    r :get, edit_admin_swan_lake_path(@swan_lake)
    assert_response :success
    assert assigns(:swan_lake)
    assert_template :edit
    assert_select "form[action='/admin/swan_lakes/#{@swan_lake.id}']"
  end

  def test_creation
    assert_difference 'SwanLake.count' do
      r :post, admin_swan_lakes_path, params: {swan_lake: {
        date: 'test date',
      }}
      swan_lake = SwanLake.last
      assert_response :redirect
      assert_redirected_to action: :show, id: swan_lake
      assert_equal 'Swan Lake created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'SwanLake.count' do
      r :post, admin_swan_lakes_path, params: {swan_lake: { }}
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Swan Lake', flash[:danger]
    end
  end

  def test_update
    r :put, admin_swan_lake_path(@swan_lake), params: {swan_lake: {
      date: 'Updated'
    }}
    assert_response :redirect
    assert_redirected_to action: :show, id: @swan_lake
    assert_equal 'Swan Lake updated', flash[:success]
    @swan_lake.reload
    assert_equal 'Updated', @swan_lake.date
  end

  def test_update_failure
    r :put, admin_swan_lake_path(@swan_lake), params: {swan_lake: {
      date: ''
    }}
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Swan Lake', flash[:danger]
    @swan_lake.reload
    refute_equal '', @swan_lake.date
  end

  def test_destroy
    assert_difference 'SwanLake.count', -1 do
      r :delete, admin_swan_lake_path(@swan_lake)
      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal 'Swan Lake deleted', flash[:success]
    end
  end
end
