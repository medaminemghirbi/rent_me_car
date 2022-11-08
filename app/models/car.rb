class Car < ApplicationRecord
    include Rails.application.routes.url_helpers
    belongs_to :model
    belongs_to :webmaster, class_name: 'Webmaster', foreign_key: 'user_id', optional: true
    belongs_to :client , class_name: "Client" , foreign_key: "user_id" ,optional: true
    has_many :demanderents , dependent: :destroy
    has_one_attached :avatar, dependent: :destroy
    enum color: %i[red blue yellow white dark gold]
    def car_image_url
      # Get the URL of the associated image
      avatar.attached? ? url_for(avatar) : nil
    end
  end