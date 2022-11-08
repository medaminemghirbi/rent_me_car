class ModelsController < ApplicationController
    include CurrentUserConcern
    # //////////////////////////////////  Models Car Controller
  
    def index
      render json: Model.all.order(id: :ASC)
    end
  
    def create
    
      @model = Model.new(post_params) 
      if @model.save
  
        render json: @model, statut: :created, location: @model
  
      else
        render json: @model.errors, statut: :unprocessable_entity
      end
    end
  
    def show
      @model = Model.find(params[:id])
      render json: @model
    end
  
    def update
      @model = Model.find(params[:id])
      if @model.update(post_params)
        render json: @model
  
      else
        render json: @model.errors, statut: :unprocessable_entity
      end
    end
  
    def destroy
      @model = Model.find(params[:id])
      @model.destroy
    end
  
    private
  

  
    def post_params

      params.permit(:model_car_name)
    end
  
    def set_post
      @model = Model.find(params[:id])
    end
  end