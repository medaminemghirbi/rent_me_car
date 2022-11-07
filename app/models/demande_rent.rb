class DemandeRent < ApplicationRecord
    validates_presence_of :status
    enum status: [:encours, :accepted,:refus ]
    belongs_to :client ,   class_name: "Client", foreign_key: "user_id", optional: true
    belongs_to :car ,   class_name: "Car", foreign_key: "car_id", optional: true
  
  end
  
  
  
