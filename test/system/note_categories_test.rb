require "application_system_test_case"

class NoteCategoriesTest < ApplicationSystemTestCase
  setup do
    @note_category = note_categories(:one)
  end

  test "visiting the index" do
    visit note_categories_url
    assert_selector "h1", text: "Note Categories"
  end

  test "creating a Note category" do
    visit note_categories_url
    click_on "New Note Category"

    fill_in "Name", with: @note_category.name
    click_on "Create Note category"

    assert_text "Note category was successfully created"
    click_on "Back"
  end

  test "updating a Note category" do
    visit note_categories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @note_category.name
    click_on "Update Note category"

    assert_text "Note category was successfully updated"
    click_on "Back"
  end

  test "destroying a Note category" do
    visit note_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Note category was successfully destroyed"
  end
end
