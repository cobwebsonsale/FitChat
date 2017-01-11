Rails.application.routes.draw do
  	devise_for :users, :controllers => { registrations: 'registrations' }

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	resources :board
  	resources :messages
  	namespace :chat do
  		resources :active, :inactive
  	end
  	resources :users

  	root 'site#index'
end
