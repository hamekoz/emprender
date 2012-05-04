class Administrador < Usuario
  has_many :noticias,
           :foreign_key => :autor_id
  has_many :eventos,
           :foreign_key => :autor_id
end
