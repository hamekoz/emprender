class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :usuario, :rol, :persona, :email, :password, :password_confirmation, :remember_me

  validates :usuario,  :presence => true,
                       :uniqueness => true,
                       :length => { :within => 4..20 }

  validates :rol, :presence => true
  validates :persona, :presence => true
  
  belongs_to :persona

#  accepts_nested_attributes_for :persona

# Muestra nombre descriptivo en RailsAdmin
  def etiqueta
    usuario
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
