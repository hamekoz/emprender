class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
#  devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :persona_id, :persona, :rol, :email, :password, :password_confirmation #, :remember_me

  validates :rol, :presence => true
  validates :persona, :presence => true
  
  belongs_to :persona

# Muestra nombre descriptivo en RailsAdmin
  def etiqueta
    email
  end

  def rol_enum
    ['Administrador', 'Representante', 'Emprendedor']
  end
  
  def administrador?
    rol == 'Administrador'
  end
  
  def representante?
    rol == 'Representante'
  end
  
  def emprendedor?
    rol == 'Emprendedor'
  end
end
