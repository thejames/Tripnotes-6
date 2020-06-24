class LinksController < ApplicationController
	before_action :set_trip
	before_action :set_link, only: [:edit, :update, :destroy]

	# GET trips/1/links
	def index
		@links = @trip.links
	end

	# GET trips/1/links/new
	def new
		@link = @trip.links.build
	end

	# GET trips/1/links/1/edit
	def edit
	end

	# POST trips/1/links
	def create
		@link = @trip.links.build(link_params)

		if @link.save
			redirect_to(@trip, notice: 'Link was successfully created.')
		else
			render action: 'new'
		end
	end

	# PUT trips/1/links/1
	def update
		if @link.update_attributes(link_params)
			redirect_to([@trip], notice: 'Link was successfully updated.')
		else
			render action: 'edit'
		end
	end

	# DELETE trips/1/links/1
	def destroy
		@link.destroy

		redirect_to trip_url(@trip)
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_trip
		@trip = Trip.find(params[:trip_id])
	end

	def set_link
		@link = @trip.links.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def link_params
		params.require(:link).permit(:title, :url)
	end
end
