class RequestsController < ApplicationController
    before_action :authorize_request
    # //////////////////////////////////  Requests Client Controller
    def index
        @requests = Request.all
        render json: @requests  , include: [  :car , :client ]
    end 
    def create       
        @request = Request.new(post_params)
        if @request.save 
            render json:  { 
                request: @request 
                },statut: :created, location: @request 
       
        else
            render json: @request.errors, statut: :unprocessable_entity
        end    
    end   
    def show
        @request = Request.find(params[:id])
        render json: @request
        
    end
  
    def update
        @request = Request.find(params[:id])
  
        
        if @request.update(post_params2)   &&post_params2[:status] =="accepted"
            render json: 
            {
                request:  @request 
            }
  
        else
        render json: @request.errors, statut: :unprocessable_entity
        end
    end
  
    def destroy
        @request = Request.find(params[:id])
        @request.destroy
    end
  
    private
  
    def post_params
        params.permit(:start_date, :end_date, :car_id, :user_id  )
        
    end
  
    def post_params2
        params.permit(:status, :start_date, :end_date, :car_id, :user_id  )
    end
  

  end