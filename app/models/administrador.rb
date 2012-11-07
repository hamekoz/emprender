##
# Administrador, especializacion de usuario con rol administrador
class Administrador < Usuario
  has_many :noticias,
           :foreign_key => :autor_id
  has_many :eventos,
           :foreign_key => :autor_id

  before_destroy :despublicar

private
  ##
  # Despublica todas las noticias y eventos creado por el administrador
  # antes de ser eliminado del sistema
  def despublicar
    noticias.each do |noticia|
      noticia.despublicar
    end
    eventos.each do |evento|
      noticia.despublicar
    end
  end
end
