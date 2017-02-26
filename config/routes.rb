Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "articles#index"
  #devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  resources :articles do
    resources :comments, only: [:create, :index, :destroy, :update]
    resources :marks, only: :create
  end

  resources :users, except: :index

  post 'comment/:id/response' => "responses#create", as: :comment_responses
  get 'comment/:id/response' => "responses#new", as: :new_comment_responses

end
