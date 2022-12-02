Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/chefs', to: 'chefs#index'
  get '/chefs/:id', to: 'chefs#show'
  get '/restaurants/:restaurant_id/chefs', to: 'restaurant_chefs#index'
end
