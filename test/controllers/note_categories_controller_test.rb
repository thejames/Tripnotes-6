require 'test_helper'

class NoteCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @note_category = note_categories(:one)
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
      post note_categories_url, params: { note_category: { name: @note_category.name } }
    end

    assert_redirected_to note_category_url(NoteCategory.last)
  end

  test "should show note_category" do
    get note_category_url(@note_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_note_category_url(@note_category)
    assert_response :success
  end

  test "should update note_category" do
    patch note_category_url(@note_category), params: { note_category: { name: @note_category.name } }
    assert_redirected_to note_category_url(@note_category)
  end

  test "should destroy note_category" do
    assert_difference('NoteCategory.count', -1) do
      delete note_category_url(@note_category)
    end

    assert_redirected_to note_categories_url
  end
end
