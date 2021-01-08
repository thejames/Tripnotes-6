class TripsController < ApplicationController
	before_action :authenticate_user!

	before_action :set_trip, only: [:show, :edit, :update, :destroy]
	before_action :set_trips_list, only: [:business, :personal, :unpaid]

	# GET /trips
	def index
		@trips = current_user.trips.past
		if !params[:year].blank?
			start_params = params[:year] + "-01-01"
			end_params = params[:year] + "-12-31"

			@trips = current_user.trips.where("start_date > ? AND end_date < ?", start_params, end_params).sort_by(&:start_date)
			@trip_category = params[:year].to_s
		end
		@trip_years = @trips.group_by{ |t| t.start_date.beginning_of_year }
		@trip_months = @trips.group_by{ |t| t.start_date.beginning_of_month }
		@trips_this_year = current_user.trips.ytd
	end

	def business
		@trip_category = "Business"
		@trip_years = current_user.trips.business.past.group_by{ |t| t.start_date.beginning_of_year }
		@trip_months = current_user.trips.business.past.group_by{ |t| t.start_date.beginning_of_month }
		@trips_this_year = current_user.trips.business.past.ytd

		render action: :index
	end

	def personal
		@trip_category = "Personal"
		@trip_years = current_user.trips.personal.past.group_by{ |t| t.start_date.beginning_of_year }
		@trip_months = current_user.trips.personal.past.group_by{ |t| t.start_date.beginning_of_month }
		@trips_this_year = current_user.trips.personal.past.ytd

		render action: :index
	end

	def unpaid
		@trip_category = "Unpaid "
		@trip_years = current_user.trips.business.unpaid.past.group_by{ |t| t.start_date.beginning_of_year }
		@trip_months = current_user.trips.business.unpaid.past.group_by{ |t| t.start_date.beginning_of_month }
		@trips_this_year = current_user.trips.unpaid.past.ytd

		render action: :index
	end

	def income
		if !params[:year].blank?
			@page_title = params[:year].to_s + " Income"

			start_params = params[:year] + "-01-01"
			end_params = params[:year] + "-12-31"

			# company_params = params[:company]
			
			# @income_by_company = current_user.trips.joins(:invoices).business.income.where("start_date > ? AND end_date < ?", start_params, end_params).group_by{ |t| t.company_name }.collect(:amount).sum
			@companies_list = current_user.trips.business.where("start_date > ? AND end_date < ?", start_params, end_params).collect(&:company_name).uniq

			@GMS_Income = current_user.trips.joins(:invoices).business.income.where("start_date > ? AND end_date < ? AND company_name = ?", start_params, end_params, "Global Med").sum(:amount)
			# select * from trips where company_name = NAME, join invoices, sum amount 
			# @income = Trip.invoices.sum
			# @income_by_company = current_user.trips.joins(:invoices).business.income.where("start_date > ? AND end_date < ?", start_params, end_params).collect(&:company_name).uniq
		else
			@page_title = "YTD Income"
		end
	end

	def sum_amount # this is for the income reporting
		Trip.invoices.sum(:amount)
	end

	def company

		if !params[:year].blank?
			start_params = params[:year] + "-01-01"
			end_params = params[:year] + "-12-31"

			@trips = current_user.trips.business.where("start_date > ? AND end_date < ? AND company_name = ?", start_params, end_params, "Global Med").sort_by(&:start_date)
			@trip_category = params[:year].to_s
		end
		@trip_years = @trips.group_by{ |t| t.start_date.beginning_of_year }
		@trip_months = @trips.group_by{ |t| t.start_date.beginning_of_month }
		@trips_this_year = current_user.trips.ytd

		render action: :index
	end

	# GET /trips/1
	def show
		@note = @trip.notes.build
		@invoice = @trip.invoices.build
		@link = @trip.links.build
		@invoices_amount = @trip.invoices.all.sum{ |e| e.amount.to_i }
	end

	# GET /trips/new
	def new
		@trip = current_user.trips.build
	end

	# GET /trips/1/edit
	def edit
	end

	# POST /trips
	def create
		@trip = current_user.trips.build(trip_params)

		if @trip.save
			redirect_to @trip, notice: 'Trip was successfully created.'
		else
			render :new
		end
	end

	# PATCH/PUT /trips/1
	def update
		if @trip.update(trip_params)
			redirect_to @trip, notice: 'Trip was successfully updated.'
		else
			render :edit
		end
	end

	# DELETE /trips/1
	def destroy
		@trip.destroy
		redirect_to trips_url, notice: 'Trip was successfully destroyed.'
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_trip
		@trip = current_user.trips.find(params[:id])
	end

	def set_trips_list
		@trips = current_user.trips.business.past.sort_by(&:start_date)
	end

	# Only allow a trusted parameter "white list" through.
	def trip_params
		params.require(:trip).permit(:name, :company_name, :is_personal, :is_paid, :description, :routing, :tripit_link, :start_date, :end_date)
	end
end
