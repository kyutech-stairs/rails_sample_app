Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  get '/tweets/:id', to: 'tweets#show'
  get '/tweets/new', to: 'tweets#new'
  post '/tweets', to: 'tweets#create'
  
end
