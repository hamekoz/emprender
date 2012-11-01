class Representante < Usuario
  has_many :noticias,
           :foreign_key => :autor_id
  has_many :eventos,
           :foreign_key => :autor_id

  before_destroy :despublicar

private
  def despublicar
    noticias.each do |noticia|
      noticia.despublicar
    end
    eventos.each do |evento|
      noticia.despublicar
    end
  end
end
