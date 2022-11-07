

class Model < ApplicationRecord
    validates_presence_of :model_name 
    has_many :Cars
  end