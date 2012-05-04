class Usuario < ActiveRecord::Base
  self.inheritance_column = :rol
  
  after_create :bloquear_usuario

  def bloquear_usuario
    lock_access! unless emprendedor?
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :rememberable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :persona_id, :persona, :rol, :email, :password, :password_confirmation
  attr_accessible :persona_attributes
  validates :rol, :presence => true
#  validates :persona, :presence => true
  
  belongs_to :persona
  belongs_to :institucion

  has_many :mensajes_recibidos, :class_name => "Mensaje", :foreign_key => :destinatario_id
  has_many :mensajes_enviados,  :class_name => "Mensaje", :foreign_key => :remitente_id

  accepts_nested_attributes_for :persona

# Muestra nombre descriptivo en RailsAdmin
  def etiqueta
    email
  end

  def rol_enum
    ['Emprendedor', 'Representante', 'Administrador' ]
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
