require 'test_helper'

class NoteCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @note_category = note_categories(:one)
    sign_in @user
  end

  test "should get index" do
    get note_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_note_category_url
    assert_response :success
  end

  test "should create note_category" do
    assert_difference('NoteCategory.count') do
      post note_categories_url, params: { note_category: { name: "New Category" } }
    end
    assert_redirected_to note_categories_url
  end

  test "should not create note_category without name" do
    assert_no_difference('NoteCategory.count') do
      post note_categories_url, params: { note_category: { name: "" } }
    end
  end

  test "should get edit" do
    get edit_note_category_url(@note_category)
    assert_response :success
  end

  test "should update note_category" do
    patch note_category_url(@note_category), params: { note_category: { name: "Updated Name" } }
    assert_redirected_to note_categories_url
  end

  test "should destroy note_category" do
    @note_category.notes.destroy_all
    assert_difference('NoteCategory.count', -1) do
      delete note_category_url(@note_category)
    end
    assert_redirected_to note_categories_url
  end

  test "redirects to login when not authenticated" do
    sign_out @user
    get note_categories_url
    assert_redirected_to new_user_session_path
  end
end
