# Rails.application.routes.draw do
  # get 'user_sessions/new'
  # get 'user_sessions/create'
#   get 'sessions/new'
#   get 'sessions/create'
#   get 'sessions/destroy'
#   resources :users, only: [:new, :create, :index, :show]
#   resources :sessions, only: [:new, :create, :destroy]
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
#   # Can be used by load balancers and uptime monitors to verify that the app is live.
#   get "up" => "rails/health#show", as: :rails_health_check

#   # Defines the root path route ("/")
#   # root "posts#index"
# end

Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/secret'
  get 'pages/dashboard'
  get '/rfqs/new', to: "rfqs#new"
  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create]
  resources :rfqs, only: [:new, :create, :show, :edit] do
    resources :quotes, only: [:new, :create, :edit, :update]
  end
  resources :quotes
  resources :items, only: [:new, :create]
end