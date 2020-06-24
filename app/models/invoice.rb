class Invoice < ApplicationRecord
  belongs_to :trip

  validates_presence_of :amount
end
