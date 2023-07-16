Rails.application.routes.draw do
  get '/books', to:'books#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :books, only: [:show]

  namespace :admin do
    resources :books, only: [:index, :new, :create]
  end
end
