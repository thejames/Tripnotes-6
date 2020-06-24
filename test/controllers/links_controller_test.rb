require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
    @link = links(:one)
  end

  test "should get index" do
    get :index, params: { trip_id: @trip }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { trip_id: @trip }
    assert_response :success
  end

  test "should create link" do
    assert_difference('Link.count') do
      post :create, params: { trip_id: @trip, link: @link.attributes }
    end

    assert_redirected_to trip_link_path(@trip, Link.last)
  end

  test "should show link" do
    get :show, params: { trip_id: @trip, id: @link }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { trip_id: @trip, id: @link }
    assert_response :success
  end

  test "should update link" do
    put :update, params: { trip_id: @trip, id: @link, link: @link.attributes }
    assert_redirected_to trip_link_path(@trip, Link.last)
  end

  test "should destroy link" do
    assert_difference('Link.count', -1) do
      delete :destroy, params: { trip_id: @trip, id: @link }
    end

    assert_redirected_to trip_links_path(@trip)
  end
end
