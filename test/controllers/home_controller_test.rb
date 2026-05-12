require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test "redirects to login when not authenticated" do
    sign_out users(:one)
    get root_url
    assert_redirected_to new_user_session_path
  end
end
