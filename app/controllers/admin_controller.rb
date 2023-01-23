class AdminController < ApplicationController
    before_action :authorize_request
    include CurrentUserConcern
    def index
    @users = User.all.select { |m| m.role == 'client' || m.role == 'admin' }
    render json: @users, methods: [:user_image_url]
    end 

    def gotoresque
      byebug
      if @current_user.role == "admin"
        redirect_to "/jobs"
      else
        render json: "you are not an admin to acces this URL"
      end
    end

    def updateadminimage
        @user = User.find(params[:id])
    
        if @user.update(image_admin)
          render json: @user, methods: [:user_image_url]
    
        else
          render json: @user.errors, statut: :unprocessable_entity
        end
    end
    def image_admin
        params.permit(:id, :avatar)
    end

    def updateadmin
        @user = User.find(params[:id])
        
        if @user.update(post_parasmadmin)
    
          render json: @user, methods: [:user_image_url]
    
        else
          render json: @user.errors, statut: :unprocessable_entity
        end
    end
    def post_parasmadmin
        params.permit(:id, :email, :password, :adress, :lastname, :firstname, :avatar)
    end

    def archive_client
        @user = User.find(params[:id])
        
        if @user.update(archive_client_params)
    
          render json: @user, methods: [:user_image_url]
    
        else
          render json: @user.errors, statut: :unprocessable_entity
        end
    end
    def archive_client_params
        params.permit(:id, is_archived)
    end

end