class RegistrationsController < ApplicationController
  before_action :authorize_request, except: %i[create confirm_email]
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_confirmed = true
      user.confirm_token = nil
      user.save
      redirect_to 'https://rentmecar.herokuapp.com/login'
    else
      render json: { status: 500 }

    end

  end


  def create
    user = User.create!(
      firstname: params['user']['firstname'],
      lastname: params['user']['lastname'],
      email: params['user']['email'],
      password: params['user']['password'],
      password_confirmation: params['user']['password_confirmation'],
      role: params['user']['role'].to_i
    )
    
    if user
      UserMailer.registration_confirmation(user).deliver
      session[:user_id] = user.id

      render json: {
        status: :created,
        user: user
      }

    end
  end
  
end