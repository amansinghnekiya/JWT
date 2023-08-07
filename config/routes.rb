Rails.application.routes.draw do
  get '/search_by_event', to: 'events#search_by_event'
  get '/search_by_category', to: 'events#search_by_category'
  get '/search_by_location', to: 'events#search_by_location'
  post '/add_event_to_favourite', to: 'favourites#add_event_to_favourite'
  resources :users, param: :_username
  resources :events
  resources :bookings
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
