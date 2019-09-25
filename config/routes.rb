Rails.application.routes.draw do
	# Static Pages
	root 'static_pages#home'
	
	get  '/signup',   to: 'users#new'
  get  'events/create'
  get  'events/show'
  get  'events/index'
	
	# Users
	resources :users
	
	# Sessions
	get  '/login',    to: 'sessions#new'
	post '/login',    to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

	# Events 
	resources :events

	# Invitations
	resources :invitations

end
