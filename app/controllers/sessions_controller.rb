class SessionsController < ApplicationController
     def create
      @user = User
              .find_by(email: params['email'])
              .try(:authenticate, params['password'])
        
       if @user
        token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        #session[:user_id] = user.id  
         render json: {
          token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
           status: :created,
           logged_in: true,
           user_id: @user.id ,
           role: @user.role, 
           user: @user
         }
       else
        render json: { error: 'unauthorized' }, status: :unauthorized
       end
     end

     def logged_in
      
      if @current_user
        render json: {
          token: token,
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