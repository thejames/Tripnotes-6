require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @trip = trips(:one)
    @link = links(:one)
    sign_in @user
  end

  test "should get index" do
    get trip_links_url(@trip)
    assert_response :success
  end

  test "should get new" do
    get new_trip_link_url(@trip)
    assert_response :success
  end

  test "should create link" do
    assert_difference('Link.count') do
      post trip_links_url(@trip), params: { link: {
        title: "New Link",
        url: "https://example.com/new"
      } }
    end
    assert_redirected_to trip_url(@trip)
  end

  test "should get edit" do
    get edit_trip_link_url(@trip, @link)
    assert_response :success
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete trip_link_url(@trip, @link)
    end
    assert_redirected_to trip_url(@trip)
  end
end
