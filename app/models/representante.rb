class Representante < Usuario
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :usuario, :email, :password, :password_confirmation, :remember_me
  
# Muestra nombre descriptivo en RailsAdmin
  def name
    usuario
  end
end
