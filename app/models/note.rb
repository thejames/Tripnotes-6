class Note < ApplicationRecord
  belongs_to :note_category
  belongs_to :trip

  validates_presence_of :content#, :note_category_id
end
