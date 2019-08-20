Rails.application.routes.draw do
  get 'cuties/index'
  get 'cuties/show'
  get 'cuties/new'
  get 'cuties/create'
  get 'cuties/update'
  get 'cuties/edit'
  get 'cuties/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :cuties do
    resources :rentals, only: [ :index, :show, :new, :create, :edit, :update ]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
