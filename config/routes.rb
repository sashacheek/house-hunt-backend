Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    post   'login',  to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    post 'signup', to: 'listers#create'
    resources :listings, only: [:index, :create, :show, :update, :destroy]
    resources :addresses, only: [:index]
    get 'listers', to: 'listers#lister_listings'
  end
end
