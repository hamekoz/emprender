class Emprendedor < Usuario
  after_create :inicializar

  def inicializar
    self.perfil = Perfil.new
    self.emprendimiento = Emprendimiento.new
    self.save
  end

  has_one :perfil
  has_one :emprendimiento

  def apadrinar(institucion)
    self.institucion = institucion if self.institucion.blank?
    self.save
  end
end
