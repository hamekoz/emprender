class Emprendedor < Usuario
  after_create :inicializar

  def inicializar
    self.perfil = Perfil.new
    self.emprendimiento = Emprendimiento.new
  end

  has_one :perfil
  has_one :emprendimiento
end
