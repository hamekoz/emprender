class Usuario < ActiveRecord::Base
  self.inheritance_column = :rol
  
  after_create :bloquear_usuario

  def bloquear_usuario
    lock_access! unless emprendedor?
  end

  def activar
    if current_usuario.administrador?
      self.unlock_access!
      self.save
    end
  end

  def desactivar
    if current_usuario.administrador?
      self.lock_access!
      self.save
    end
    #Previene que el administrador actual se autobloquee asegurando por lo menos un administrador activo
    if current_usuario.lock_access?
      current_usuario.unlock_access!
      current_usuario.save
    end
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :rememberable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :rol, :email, :password, :password_confirmation
  attr_accessible :nombre, :apellido, :sexo
  attr_accessible :institucion, :institucion_id

  validates :nombre, :presence => true
  validates :apellido, :presence => true
  validates :rol, :presence => true
  
  belongs_to :institucion

  has_many :mensajes_recibidos, :class_name => "Mensaje", :foreign_key => :destinatario_id
  has_many :mensajes_enviados,  :class_name => "Mensaje", :foreign_key => :remitente_id

# Muestra nombre descriptivo en RailsAdmin
  def etiqueta
    nombre_completo
  end

  def nombre_completo
    "#{nombre} #{apellido}"
  end

  def sexo_enum
    ['Femenino', 'Masculino']
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
