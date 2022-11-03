class User < ApplicationRecord
    has_secure_password
    validates_presence_of :email, :firstname, :lastname, :role
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_uniqueness_of :email
  end