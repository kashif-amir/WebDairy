require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dashboards_new_url
    assert_response :success
  end
end
