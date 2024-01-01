class HomeController < ApplicationController
	# before_action :authenticate_user!

	def index
		@all_trips = current_user.trips

		@current_trips = current_user.trips.where("start_date <= ? AND end_date >= ?", Time.now.beginning_of_day, Time.now.beginning_of_day - 1.day)
		@upcoming_trips = current_user.trips.where("start_date > ?", Time.now.midnight).order('start_date')

		@ytd_income = current_user.trips.joins(:invoices).business.income.ytd.sum(:amount)
		@ytd_unpaid_income = current_user.trips.joins(:invoices).business.income.unpaid.ytd.sum(:amount)
		@ytd_unpaid_expenses = current_user.trips.joins(:invoices).business.unpaid.expenses.ytd.sum(:amount)
		@ytd_unpaid_total = current_user.trips.joins(:invoices).business.unpaid.ytd.sum(:amount)

		# @ytd_hotel_stays = HotelStay.where(arrival_date: (Time.now.beginning_of_year - 1.day)..Time.now.midnight).count
		# @all_hilton_stays = HotelStay.where(property_group: 'Hilton', arrival_date: (Time.at(0))..Time.now.midnight).count
		# @all_spg_stays = HotelStay.where(property_group: 'Starwood', arrival_date: (Time.at(0))..Time.now.midnight).count
		# @all_hotelsdotcom_stays = HotelStay.where(property_group: 'Hotels.com', arrival_date: (Time.at(0))..Time.now.midnight).count
		# @ytd_hilton_stays = HotelStay.where(property_group: 'Hilton', arrival_date: (Time.now.beginning_of_year - 1.day)..Time.now.midnight)
		# @ytd_spg_stays = HotelStay.where(property_group: 'Starwood', arrival_date: (Time.now.beginning_of_year - 1.day)..Time.now.midnight)
		# @ytd_hyatt_stays = HotelStay.where(property_group: 'Hyatt', arrival_date: (Time.now.beginning_of_year - 1.day)..Time.now.midnight)
		# @ytd_hotelsdotcom_stays = HotelStay.where(property_group: 'Hotels.com', arrival_date: (Time.now.beginning_of_year - 1.day)..Time.now.midnight)
	end
end
