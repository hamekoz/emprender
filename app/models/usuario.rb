##
# Usuario que puede utilizar el sistema
class Usuario < ActiveRecord::Base
  self.inheritance_column = :rol
  
#  after_create :bloquear_usuario
  after_create :inicializar

  ##
  # Inicializa el Perfil y el Emprendimiento de un Emprendedor luego de crearlo
  def inicializar
    if self.emprendedor?
      emprendedor = Emprendedor.find(self.id)
      emprendedor.perfil = Perfil.new if emprendedor.perfil.blank?
      emprendedor.emprendimiento = Emprendimiento.new if emprendedor.emprendimiento.blank?
      emprendedor.aceptado = true
      emprendedor.save
    end
  end

  def active_for_authentication?
    super && aceptado?
  end

  def inactive_message
    confirmed? && !aceptado? ? :inactive : super
  end

  ##
  # Bloquea al usuario si no es un Emprendedor luego de ser creado
  # Debe ser desbloqueado por un Administrador que verifique la cuenta
#  def bloquear_usuario
#    lock_access! unless emprendedor?
#    self.aprobado = emprendedor?
#    self.save
#  end

  ##
  # Bloquea el Usuario para que NO pueda utilizar el sistema
  def bloquear
    self.unlock_access!
    self.save
  end

  ##
  # Desbloquea el Usuario para que pueda utilizar el sistema
  def desbloquear
    self.lock_access!
    self.save
  end

  ##
  # Marca el Usuario como aceptado
  def aceptar
    self.aceptado = true
    self.save
  end

  ##
  # Marca el Usuario como no aceptado
  def rechazar
    self.aceptado = false
    self.save
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :rememberable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :rol, :email, :password, :password_confirmation, :aprobado,
                  :nombre, :apellido, :sexo, :institucion, :institucion_id

  validates :nombre, :presence => true
  validates :apellido, :presence => true
  validates :rol, :presence => true
  
  belongs_to :institucion

  has_many :mensajes_recibidos, :class_name => "Mensaje", :foreign_key => :destinatario_id
  has_many :mensajes_enviados,  :class_name => "Mensaje", :foreign_key => :remitente_id

  ##
  # Nombre visible
  def etiqueta
    nombre_completo
  end

  ##
  # Devuelve el nombre completo del Usuario
  def nombre_completo
    "#{nombre} #{apellido}"
  end

  ##
  # == Enumerado
  # Posibles valores del atributo sexo
  def sexo_enum
    ['Femenino', 'Masculino']
  end

  ##
  # == Enumerado
  # Posibles valores del atributo rol
  def rol_enum
    ['Emprendedor', 'Representante', 'Administrador' ]
  end

  ##
  # Verdadero si el Rol del usuario es Administrador
  def administrador?
    rol == 'Administrador'
  end

  ##
  # Verdadero si el Rol del usuario es Representante
  def representante?
    rol == 'Representante'
  end

  ##
  # Verdadero si el Rol del usuario es Emprendedor
  def emprendedor?
    rol == 'Emprendedor'
  end

  default_scope order(:nombre, :apellido)
end
