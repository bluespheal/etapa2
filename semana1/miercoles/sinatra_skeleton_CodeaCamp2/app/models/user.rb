class User < ActiveRecord::Base
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A([\w_\d\-]+)?\w+@[\w]+\.[\w]+{2,}/} 
    validates :password, presence: true, format: {with: /\A[a-z,A-Z,0-9,_]{6,}/ }

  def self.authenticate(email, password)
    User.exists?(:email => email, :password => password)
  end
end