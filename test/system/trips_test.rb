require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "creating a Trip" do
    visit trips_url
    click_on "New Trip"

    fill_in "Company name", with: @trip.company_name
    fill_in "Description", with: @trip.description
    fill_in "End date", with: @trip.end_date
    check "Is paid" if @trip.is_paid
    check "Is personal" if @trip.is_personal
    fill_in "Name", with: @trip.name
    fill_in "Routing", with: @trip.routing
    fill_in "Start date", with: @trip.start_date
    fill_in "Tripit link", with: @trip.tripit_link
    fill_in "User", with: @trip.user_id
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "updating a Trip" do
    visit trips_url
    click_on "Edit", match: :first

    fill_in "Company name", with: @trip.company_name
    fill_in "Description", with: @trip.description
    fill_in "End date", with: @trip.end_date
    check "Is paid" if @trip.is_paid
    check "Is personal" if @trip.is_personal
    fill_in "Name", with: @trip.name
    fill_in "Routing", with: @trip.routing
    fill_in "Start date", with: @trip.start_date
    fill_in "Tripit link", with: @trip.tripit_link
    fill_in "User", with: @trip.user_id
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip" do
    visit trips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip was successfully destroyed"
  end
end
