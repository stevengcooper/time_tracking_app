require 'test_helper'

class DashboardsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    
  end

  test "dashboard index is the root page" do
    :root
    assert_response :success

  end

end
