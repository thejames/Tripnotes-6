require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test "valid link" do
    link = links(:one)
    assert link.valid?
  end

  test "requires title" do
    link = Link.new(trip: trips(:one), url: "https://example.com")
    assert_not link.valid?
    assert_includes link.errors[:title], "can't be blank"
  end

  test "requires url" do
    link = Link.new(trip: trips(:one), title: "Example")
    assert_not link.valid?
    assert_includes link.errors[:url], "can't be blank"
  end

  test "belongs to trip" do
    link = links(:one)
    assert_equal trips(:one), link.trip
  end
end
