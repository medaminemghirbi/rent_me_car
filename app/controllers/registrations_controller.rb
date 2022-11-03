class RegistrationsController < ApplicationController
    def create
      @user = User.create!(
        firstname: params['firstname'],
        lastname: params['lastname'],
        email: params['email'],
        password: params['password'],
        password_confirmation: params['password_confirmation'],
        role: params['role'].to_i)
      if @user 
        session[:@user_id] = @user.id  
        render json: {
          status: :created,
          @user: @user
        }
  
      end
    end
  end