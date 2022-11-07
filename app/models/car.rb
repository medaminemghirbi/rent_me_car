class Car < ApplicationRecord
    belongs_to :model
    belongs_to :webmaster, class_name: 'Webmaster', foreign_key: 'user_id', optional: true
    belongs_to :client , class_name: "Client" , foreign_key: "user_id" ,optional: true
    has_many :demanderents , dependent: :destroy
  end