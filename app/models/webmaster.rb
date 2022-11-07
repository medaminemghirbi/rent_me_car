class Webmaster < User
    validates_presence_of :role, presence: true, default: 'admin'
    has_many :cars, dependent: :destroy
  end