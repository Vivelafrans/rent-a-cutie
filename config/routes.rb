Rails.application.routes.draw do
  devise_for :users

  get '/dashboard', to: 'users#dashboard'

  root to: 'pages#home'

  resources :cuties do
    resources :rentals, only: [ :index, :show, :new, :create, :edit, :update ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
