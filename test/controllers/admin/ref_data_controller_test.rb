require_relative '../../test_helper'

class Admin::RefDataControllerTest < ActionDispatch::IntegrationTest

  setup do
    @ref_data = ref_data(:default)
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
    r :get, admin_ref_data_path
    assert_response :success
    assert assigns(:ref_data)
    assert_template :index
  end

  def test_get_show
    r :get, admin_ref_data_path(@ref_data)
    assert_response :success
    assert assigns(:ref_data)
    assert_template :show
  end

  def test_get_show_failure
    r :get, admin_ref_data_path('invalid')
    assert_response :redirect
    assert_redirected_to action: :index
    assert_equal 'Ref Data not found', flash[:danger]
  end

  def test_get_new
    r :get, new_admin_ref_data_path
    assert_response :success
    assert assigns(:ref_data)
    assert_template :new
    assert_select "form[action='/admin/ref_data']"
  end

  def test_get_edit
    r :get, edit_admin_ref_data_path(@ref_data)
    assert_response :success
    assert assigns(:ref_data)
    assert_template :edit
    assert_select "form[action='/admin/ref_data/#{@ref_data.id}']"
  end

  def test_creation
    assert_difference 'RefData.count' do
      r :post, admin_ref_data_path, params: {ref_data: {
        page_num: 'test page_num',
        label: 'test label',
      }}
      ref_data = RefData.last
      assert_response :redirect
      assert_redirected_to action: :show, id: ref_data
      assert_equal 'Ref Data created', flash[:success]
    end
  end

  def test_creation_failure
    assert_no_difference 'RefData.count' do
      r :post, admin_ref_data_path, params: {ref_data: { }}
      assert_response :success
      assert_template :new
      assert_equal 'Failed to create Ref Data', flash[:danger]
    end
  end

  def test_update
    r :put, admin_ref_data_path(@ref_data), params: {ref_data: {
      page_num: 'Updated'
    }}
    assert_response :redirect
    assert_redirected_to action: :show, id: @ref_data
    assert_equal 'Ref Data updated', flash[:success]
    @ref_data.reload
    assert_equal 'Updated', @ref_data.page_num
  end

  def test_update_failure
    r :put, admin_ref_data_path(@ref_data), params: {ref_data: {
      page_num: ''
    }}
    assert_response :success
    assert_template :edit
    assert_equal 'Failed to update Ref Data', flash[:danger]
    @ref_data.reload
    refute_equal '', @ref_data.page_num
  end

  def test_destroy
    assert_difference 'RefData.count', -1 do
      r :delete, admin_ref_data_path(@ref_data)
      assert_response :redirect
      assert_redirected_to action: :index
      assert_equal 'Ref Data deleted', flash[:success]
    end
  end
end
