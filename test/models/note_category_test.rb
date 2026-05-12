require 'test_helper'

class NoteCategoryTest < ActiveSupport::TestCase
  test "valid note category" do
    category = note_categories(:one)
    assert category.valid?
  end

  test "requires name" do
    category = NoteCategory.new
    assert_not category.valid?
    assert_includes category.errors[:name], "can't be blank"
  end

  test "has many notes" do
    category = note_categories(:one)
    assert_respond_to category, :notes
  end
end
