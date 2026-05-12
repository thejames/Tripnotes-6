require 'test_helper'

class TripTest < ActiveSupport::TestCase
  test "valid trip" do
    trip = trips(:one)
    assert trip.valid?
  end

  test "requires name" do
    trip = Trip.new(start_date: Time.now, end_date: Time.now + 1.day, user: users(:one))
    assert_not trip.valid?
    assert_includes trip.errors[:name], "can't be blank"
  end

  test "requires start_date" do
    trip = Trip.new(name: "Test", end_date: Time.now, user: users(:one))
    assert_not trip.valid?
    assert_includes trip.errors[:start_date], "can't be blank"
  end

  test "requires end_date" do
    trip = Trip.new(name: "Test", start_date: Time.now, user: users(:one))
    assert_not trip.valid?
    assert_includes trip.errors[:end_date], "can't be blank"
  end

  test "belongs to user" do
    trip = trips(:one)
    assert_equal users(:one), trip.user
  end

  test "has many notes" do
    trip = trips(:one)
    assert_respond_to trip, :notes
  end

  test "has many invoices" do
    trip = trips(:one)
    assert_respond_to trip, :invoices
  end

  test "has many links" do
    trip = trips(:one)
    assert_respond_to trip, :links
  end

  test "destroying trip destroys associated notes" do
    trip = trips(:one)
    trip.links.destroy_all
    assert_difference('Note.count', -trip.notes.count) do
      trip.destroy
    end
  end

  test "destroying trip destroys associated invoices" do
    trip = trips(:one)
    trip.links.destroy_all
    assert_difference('Invoice.count', -trip.invoices.count) do
      trip.destroy
    end
  end

  test "business scope returns non-personal trips" do
    business_trips = Trip.business
    assert business_trips.all? { |t| t.is_personal == false }
  end

  test "personal scope returns personal trips" do
    personal_trips = Trip.personal
    assert personal_trips.all? { |t| t.is_personal == true }
  end

  test "paid scope returns paid trips" do
    paid_trips = Trip.paid
    assert paid_trips.all? { |t| t.is_paid == true }
  end

  test "unpaid scope returns unpaid trips" do
    unpaid_trips = Trip.unpaid
    assert unpaid_trips.all? { |t| t.is_paid == false }
  end

  test "past scope returns trips with start_date in the past" do
    past_trips = Trip.past
    assert past_trips.all? { |t| t.start_date <= Time.now }
  end

  test "previous_trip returns trip with earlier end_date" do
    trip = trips(:one)
    previous = trip.previous_trip
    assert previous.nil? || previous.end_date < trip.end_date
  end

  test "next_trip returns trip with later end_date" do
    trip = trips(:three)
    next_trip = trip.next_trip
    assert next_trip.nil? || next_trip.end_date > trip.end_date
  end

  test "COMPANY_NAMES is defined" do
    assert_includes Trip::COMPANY_NAMES, 'Parkview'
    assert_includes Trip::COMPANY_NAMES, 'Global Med'
  end

  test "per_page is 20" do
    assert_equal 20, Trip.per_page
  end
end
