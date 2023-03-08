class CarsController < ApplicationController
  before_action :authorize_request
    # //////////////////////////////////  Cars

    def index
      render json: Car.all.order(id: :ASC), methods: [:car_image_url]  #Change here
    end

    def create

      @car = Car.new(post_params)
      if @car.save

        render json: @car, methods: [:car_image_url], statut: :created, location: @car

      else
        render json: @car.errors, statut: :unprocessable_entity
      end
    end

    def show
      @car = Car.find(params[:id])
      render json: @car
    end

    def update
      @car = Car.find(params[:id])
      if @car.update(post_params2)
        render json: @car

      else
        render json: @car.errors, statut: :unprocessable_entity
      end
    end

    def destroy
      @car = Car.find(params[:id])
      @car.destroy
    end

    private

    def post_params
      params.permit(:color, :body_style, :doors, :engine, :seats, :price, :transmission, :emission_class, :model_id
        )
    end

    def post_params2
      params.permit( :color, :body_style, :doors, :engine, :seats, :price, :transmission, :disponible, :emission_class, :model_id, :user_id
        )
    end

    def set_post
      @car = Car.find(params[:id])
    end
  end