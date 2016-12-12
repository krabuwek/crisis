Rails.application.routes.draw do
  root "articles#index"
  devise_for :users

  resources :articles do
    resources :comments, only: [:create, :index, :destroy, :update]
    resources :marks, only: :create
  end

  resources :users

end
