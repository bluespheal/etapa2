class User < ActiveRecord::Base
  include BCrypt

  has_many :questions
  has_many :answers

  validates :username, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  validates :email, format: { with: /\A([\w_\d\-]+)?\w+@[\w]+\.[\w]+{2,}/} 
  validates :password, format: {with: /\A[a-z,A-Z,0-9,_,$,.,\/]{6,}/ }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
   