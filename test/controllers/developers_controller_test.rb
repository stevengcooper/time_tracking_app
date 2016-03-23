require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  setup do
    @developer = developers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:developers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create developer" do
    assert_difference('Developer.count') do
      post :create, developer: { email: @developer.email, first_name: @developer.first_name, last_name: @developer.last_name, password_digest: @developer.password_digest }
    end

    assert_redirected_to developer_path(assigns(:developer))
  end

  test "should show developer" do
    get :show, id: @developer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @developer
    assert_response :success
  end

  test "should update developer" do
    patch :update, id: @developer, developer: { email: @developer.email, first_name: @developer.first_name, last_name: @developer.last_name, password_digest: @developer.password_digest }
    assert_redirected_to developers_index_path(assigns(:developer))
  end

  test "should destroy developer" do
    assert_difference('Developer.count', -1) do
      delete :delete, id: @developer
    end

    assert_redirected_to developers_index_path
  end
end
