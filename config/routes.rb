Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :models, only: %i[create index show update destroy]
  resources :cars, only: %i[create index show update destroy]
  resources :registrations, only: [:create, :confirm_email] do
    member do
      get :confirm_email
    end
  end

  delete :logout, to: 'sessions#logout'
  get :logged_in, to: 'sessions#logged_in'
end