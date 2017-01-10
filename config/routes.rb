Rails.application.routes.draw do
  	devise_for :users, :controllers => { registrations: 'registrations' }

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :board
  	namespace :chat do
  		resources :active, :inactive, :create
  	end

  	root 'site#index'
end
