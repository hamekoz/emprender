##
# Emprendedor corresponde a los usuarios con rol Emprendedor
class Emprendedor < Usuario
  attr_accessible :perfil, :emprendimiento, :perfil_attributes, :emprendimiento_attributes

  after_create :inicializar

  ##
  # Inicializa el Perfil y el Emprendimiento de un Emprendedor luego de crearlo
  def inicializar
    self.perfil = Perfil.new
    self.emprendimiento = Emprendimiento.new
    self.save
  end

  has_one :perfil
  has_one :emprendimiento

  accepts_nested_attributes_for :perfil, :emprendimiento

  ##
  # Establece la Institucion del Emprendedor con la misma Institucion del
  # Representante o Administrador que quiera apadrinar al Emprendedor
  def apadrinar(institucion)
    self.institucion = institucion if self.institucion.blank?
    self.save
  end
end
