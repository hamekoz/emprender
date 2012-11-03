class Emprendedor < Usuario
  attr_accessible :perfil, :emprendimiento, :perfil_attributes, :emprendimiento_attributes

  after_create :inicializar
#  after_initialize :iniciar

#  def iniciar
#    self.perfil = Perfil.new if perfil.blank?
#    self.emprendimiento = Emprendimiento.new if emprendimiento.blank?
#  end

  def inicializar
    self.perfil = Perfil.new
    self.emprendimiento = Emprendimiento.new
    self.save
  end

  has_one :perfil
  has_one :emprendimiento

  accepts_nested_attributes_for :perfil, :emprendimiento

  def apadrinar(institucion)
    self.institucion = institucion if self.institucion.blank?
    self.save
  end
end
