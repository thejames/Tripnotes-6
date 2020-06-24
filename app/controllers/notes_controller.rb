class NotesController < ApplicationController
	before_action :authenticate_user!

	before_action :set_trip
	before_action :set_note, only: [:show, :edit, :update, :destroy]

	# GET trips/1/notes/1
	def show
	end

	# GET trips/1/notes/new
	def new
		@note = @trip.notes.build
	end

	# GET trips/1/notes/1/edit
	def edit
	end

	# POST trips/1/notes
	def create
		@note = @trip.notes.build(note_params)

		if @note.save
			redirect_to(@note.trip)
		else
			render action: 'new'
		end
	end

	# PUT trips/1/notes/1
	def update
		if @note.update_attributes(note_params)
			redirect_to([@note.trip], notice: 'Note was successfully updated.')
		else
			render action: 'edit'
		end
	end

	# DELETE trips/1/notes/1
	def destroy
		@note.destroy

		redirect_to trip_notes_url(@trip)
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_trip
		@trip = Trip.find(params[:trip_id])
	end

	def set_note
		@note = @trip.notes.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def note_params
		params.require(:note).permit( :content, :note_category_id )
	end
end
