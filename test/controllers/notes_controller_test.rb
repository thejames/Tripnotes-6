require 'test_helper'

class NotesControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
    @note = notes(:one)
  end

  test "should get index" do
    get :index, params: { trip_id: @trip }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { trip_id: @trip }
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post :create, params: { trip_id: @trip, note: @note.attributes }
    end

    assert_redirected_to trip_note_path(@trip, Note.last)
  end

  test "should show note" do
    get :show, params: { trip_id: @trip, id: @note }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { trip_id: @trip, id: @note }
    assert_response :success
  end

  test "should update note" do
    put :update, params: { trip_id: @trip, id: @note, note: @note.attributes }
    assert_redirected_to trip_note_path(@trip, Note.last)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete :destroy, params: { trip_id: @trip, id: @note }
    end

    assert_redirected_to trip_notes_path(@trip)
  end
end
