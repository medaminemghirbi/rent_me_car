class SessionsController < ApplicationController
      def create
        @user = User
              .find_by(email: params['user']['email'])
              .try(:authenticate, params['user']['password'])

        if @user.nil?
            render json: { error: 'User does not exist' }, status: :unauthorized
        elsif @user.email_confirmed == false
            render json: { error: 'please confirm your email' }
        elsif @user.email_confirmed == true
            session[:user_id] = @user.id           
            token = JsonWebToken.encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            Token.create(token: token,
            expired_at:time,
            user_id: @user.id)
            render json: {
              token: token,
              exp: time.strftime("%m-%d-%Y %H:%M")
            }
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end
   end