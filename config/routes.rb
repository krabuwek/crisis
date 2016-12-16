Rails.application.routes.draw do
  
  root "articles#index"
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :articles do
    resources :comments, only: [:create, :index, :destroy, :update]
    resources :marks, only: :create
  end

  resources :users

  post 'comment/:id/response' => "responses#create", as: :comment_responses


end
