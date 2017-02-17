class User < ActiveRecord::Base
    # ej. User.authenticate('fernando@codea.mx', 'qwerty')
    validates :name, presence: true, uniqueness: true, format: { with: /\A(https?:\/\/)/}

  def self.authenticate(email, password)

    # si el email y el password corresponden a un usuario valido, regresa el usuario
    # de otra manera regresa nil
  end

end