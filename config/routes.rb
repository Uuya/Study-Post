Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
end
