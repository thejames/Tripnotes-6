class Link < ApplicationRecord
  belongs_to :trip

  validates_presence_of :title, :url
end
