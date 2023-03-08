require 'resque/server'
Rails.application.routes.draw do
  root to: 'static#home'
  resources :admin, only: %i[show create index update destroy]
  resources :sessions, only: [:create]
  resources :models, only: %i[create index show update destroy]
  resources :cars, only: %i[create index show update destroy]
  resources :requests, only: %i[create index show update destroy]
  resources :registrations, only: [:create, :confirm_email] do
    member do
      get :confirm_email
    end
  end
  get :gotoresque, to: 'admin#gotoresque'
  patch '/updateadminimage/:id', to: 'admin#updateadminimage'
  mount Resque::Server.new, at: '/jobs'
  delete :logout, to: 'registrations#logout'
  get :logged_in, to: 'registrations#logged_in'
end