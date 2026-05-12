require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = users(:one)
    assert user.valid?
  end

  test "requires email" do
    user = User.new(username: "newuser", password: "password123")
    assert_not user.valid?
    assert_includes user.errors[:email], "can't be blank"
  end

  test "requires password" do
    user = User.new(username: "newuser", email: "test@example.com")
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end

  test "has many trips" do
    user = users(:one)
    assert_respond_to user, :trips
  end

  test "destroying user destroys associated trips" do
    user = users(:one)
    # Clear links first since they lack dependent: :destroy
    Link.where(trip: user.trips).destroy_all
    assert_difference('Trip.count', -user.trips.count) do
      user.destroy
    end
  end
end
