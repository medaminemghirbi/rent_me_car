class AdminController < ApplicationController
    before_action :authorize_request
    def index
    @users = User.all.select { |m| m.role == 'client' || m.role == 'admin' }
    render json: @users, methods: [:user_image_url]
    end 
end