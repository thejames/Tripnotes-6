require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test "valid note" do
    note = notes(:one)
    assert note.valid?
  end

  test "requires content" do
    note = Note.new(trip: trips(:one), note_category: note_categories(:one))
    assert_not note.valid?
    assert_includes note.errors[:content], "can't be blank"
  end

  test "belongs to trip" do
    note = notes(:one)
    assert_equal trips(:one), note.trip
  end

  test "belongs to note_category" do
    note = notes(:one)
    assert_equal note_categories(:one), note.note_category
  end
end
