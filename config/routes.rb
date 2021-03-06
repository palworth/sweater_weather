Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#show'
      get '/background', to: 'backgrounds#show'
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      get '/antipode', to: 'antipodes#show'
      post '/road_trip', to: 'road_trips#create'
    end
  end
end
