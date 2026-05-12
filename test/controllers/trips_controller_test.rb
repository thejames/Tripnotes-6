require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @trip = trips(:one)
    sign_in @user
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: {
        name: "New Trip",
        company_name: "Parkview",
        is_personal: false,
        is_paid: false,
        description: "Test trip",
        routing: "IND-LAX",
        start_date: "2020-08-01",
        end_date: "2020-08-05"
      } }
    end
    assert_redirected_to trip_url(Trip.last)
  end

  test "should not create trip without name" do
    assert_no_difference('Trip.count') do
      post trips_url, params: { trip: {
        name: "",
        start_date: "2020-08-01",
        end_date: "2020-08-05"
      } }
    end
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { name: "Updated Trip Name" } }
    assert_redirected_to trip_url(@trip)
    @trip.reload
    assert_equal "Updated Trip Name", @trip.name
  end

  test "should destroy trip" do
    # Trip without links to avoid FK constraint
    trip = trips(:three)
    trip.links.destroy_all
    assert_difference('Trip.count', -1) do
      delete trip_url(trip)
    end
    assert_redirected_to trips_url
  end

  test "should get business trips" do
    get business_trips_url
    assert_response :success
  end

  test "should get personal trips" do
    get personal_trips_url
    assert_response :success
  end

  test "should get unpaid trips" do
    get unpaid_trips_url
    assert_response :success
  end

  test "should get income with year filter" do
    get income_trips_url, params: { year: "2020" }
    assert_response :success
  end

  test "redirects to login when not authenticated" do
    sign_out @user
    get trips_url
    assert_redirected_to new_user_session_path
  end

  test "cannot access another user's trip" do
    sign_out @user
    sign_in users(:two)
    get trip_url(@trip)
    assert_response :not_found
  end
end
