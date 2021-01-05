class Trip < ApplicationRecord
  has_many :links
	has_many :invoices, dependent: :destroy
	has_many :notes, dependent: :destroy
	belongs_to :user
	validates_presence_of :name, :start_date, :end_date

	scope :personal, -> { where( is_personal: true ) }
	scope :business, -> { where( is_personal: false ) }
	scope :paid, -> { where( is_paid: true ) }
	scope :unpaid, -> { where( is_paid: false ) }
	scope :ytd, -> { where(start_date: (Time.now.beginning_of_year - 1.day)..Time.now.midnight) }
	scope :past, -> { where("start_date <= ?", Time.now ) }
	scope :expenses, -> { where( invoices: {is_income: false} )}
	scope :income, -> { where( invoices: {is_income: true} )}

	# scope :previous_trip, -> { where(end_date: < end_date ) }

	def previous_trip
	  self.class.where("end_date < ?", end_date).order("end_date DESC").first
	end

	def next_trip
	  self.class.where("end_date > ?", end_date).order("end_date ASC").first
	end

	COMPANY_NAMES = ['','Parkview', 'Global Med', '360', 'Air Escort Medical', 'Air Care 1']
end
