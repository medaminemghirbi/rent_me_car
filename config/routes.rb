Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create, :confirm_email] do
    member do
      get :confirm_email
    end
  end
end