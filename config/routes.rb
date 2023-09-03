Rails.application.routes.draw do
  get "/books", to: "books#index"
  get '/lendings', to:'lendings#index'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :books, only: [:show]
  resources :lendings, only: [:create, :edit, :update]

  namespace :admin do
    resources :books, only: [:index, :new, :create]
  end
end
