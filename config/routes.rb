Rails.application.routes.draw do
	# Static Pages
	root 'static_pages#home'
	get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/index'
	
	# Users
	resources :users
	
	# Sessions
	resources :events
	get  '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'

end
