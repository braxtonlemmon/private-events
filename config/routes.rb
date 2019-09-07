Rails.application.routes.draw do
	get 'events/new'
  get 'events/create'
  get 'events/show'
  get 'events/index'
	resources :users
	get  '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	resources :events
end
