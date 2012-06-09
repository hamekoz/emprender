class Emprendedor < Usuario
  has_one :perfil
  has_one :emprendimiento

  has_many :productos
  has_many :servicios
end
