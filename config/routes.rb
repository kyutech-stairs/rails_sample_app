Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/tweets', to: 'tweets#index'
  # get '/tweets/new', to: 'tweets#new'
  # get '/tweets/:id', to: 'tweets#show'

  # post '/tweets', to: 'tweets#create'
  resources :tweets
end
