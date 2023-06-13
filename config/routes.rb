# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast_data#index'
      get '/book-search', to: 'book_search#index'
      post '/users', to: 'users#create'
    end
  end
end
