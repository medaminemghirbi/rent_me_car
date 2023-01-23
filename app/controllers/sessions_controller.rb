class SessionsController < ApplicationController
  include CurrentUserConcern
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
          byebug
            payload = { 
              user_data: @user.to_json
            }
            
            token = JsonWebToken.encode(payload)
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



     def logged_in
      if @current_user
        render json: {
          logged_in: true,
          user: @current_user
        }, methods: [:user_image_url]
      else
        render json: {
          logged_in: false
        }
      end
    end

    def logout
      reset_session
      render json: { status: 200, logged_out: true }
    end
   end