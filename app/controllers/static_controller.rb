class StaticController < ApplicationController
    def home
    render json: { status: "it's working" }
      #render file: Rails.root.join('public', 'index.html')
  
    end
  end