Rails.application.routes.draw do

	resources :trips do
		collection do
			get :unpaid
			get :personal
			get :business
			get :income
			get :company
		end
		resources :notes
		resources :invoices
		resources :links
	end

	resources :note_categories

	devise_for :users
	# get 'home/index'
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root to: "home#index"
end
