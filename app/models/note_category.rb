class NoteCategory < ApplicationRecord
	has_many :notes
	validates :name, presence: true
end
