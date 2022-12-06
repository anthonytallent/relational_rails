Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/chefs', to: 'chefs#index'
  get '/chefs/:id', to: 'chefs#show'
  get '/restaurants/:restaurant_id/chefs', to: 'restaurant_chefs#index'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'
  get '/restaurants/:restaurant_id/chefs/new', to: 'restaurant_chefs#new'
  post '/restaurants/:restaurant_id/chefs', to: 'restaurant_chefs#create'
  get '/chefs/:id/edit', to: 'chefs#edit'
  patch '/chefs/:id', to: 'chefs#update'
end
