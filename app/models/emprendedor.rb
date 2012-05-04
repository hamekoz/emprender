class Emprendedor < Usuario
  has_one :perfil
  has_one :emprendimiento

  has_many :productos
  has_many :servicios

  has_many :comentarios, :as => :comentable
end
