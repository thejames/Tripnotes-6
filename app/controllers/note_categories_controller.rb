class NoteCategoriesController < ApplicationController
	before_action :authenticate_user!

	before_action :set_note_category, only: [:show, :edit, :update, :destroy]

	# GET /note_categories
	def index
		@note_categories = NoteCategory.all.sort_by(&:name)
	end

	# GET /note_categories/1
	def show
	end

	# GET /note_categories/new
	def new
		@note_category = NoteCategory.new
	end

	# GET /note_categories/1/edit
	def edit
	end

	# POST /note_categories
	def create
		@note_category = NoteCategory.new(note_category_params)

		if @note_category.save
			redirect_to note_categories_url, notice: 'Note category was successfully created.'
		else
			render :new
		end
	end

	# PATCH/PUT /note_categories/1
	def update
		if @note_category.update(note_category_params)
			redirect_to note_categories_url, notice: 'Note category was successfully updated.'
		else
			render :edit
		end
	end

	# DELETE /note_categories/1
	def destroy
		@note_category.destroy
		redirect_to note_categories_url, notice: 'Note category was successfully destroyed.'
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_note_category
		@note_category = NoteCategory.find(params[:id])
	end

	# Only allow a trusted parameter "white list" through.
	def note_category_params
		params.require(:note_category).permit(:name)
	end
end
