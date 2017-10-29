##
# Representante de una Institucion con acceso al sistema
class Representante < Usuario
  has_many :noticias,
           :foreign_key => :autor_id
  has_many :eventos,
           :foreign_key => :autor_id

  validates_presence_of :institucion

  before_destroy :despublicar

  # attr_accessible :aceptado

private
  ##
  # Antes despublica las noticias y eventos publicadas por el Representante antes
  # de eliminarlo del sistema
  def despublicar
    noticias.each do |noticia|
      noticia.despublicar
    end
    eventos.each do |evento|
      noticia.despublicar
    end
  end
end
