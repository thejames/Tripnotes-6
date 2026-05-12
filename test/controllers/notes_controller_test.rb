require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @trip = trips(:one)
    @note = notes(:one)
    sign_in @user
  end

  test "should get new" do
    get new_trip_note_url(@trip)
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post trip_notes_url(@trip), params: { note: {
        content: "New test note",
        note_category_id: note_categories(:one).id
      } }
    end
    assert_redirected_to trip_url(@trip)
  end

  test "should get edit" do
    get edit_trip_note_url(@trip, @note)
    assert_response :success
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete trip_note_url(@trip, @note)
    end
    assert_redirected_to trip_notes_url(@trip)
  end

  test "redirects to login when not authenticated" do
    sign_out @user
    get new_trip_note_url(@trip)
    assert_redirected_to new_user_session_path
  end
end
