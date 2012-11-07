##
# Noticia sobre la economia social
class Noticia < ActiveRecord::Base
  attr_accessible :titulo, :resumen, :texto, :autor, :autor_id, :publicada

  validates_presence_of :titulo, :resumen, :texto, :autor

  belongs_to :autor, :class_name => 'Usuario'

  has_many :comentarios, :as => :comentable

  scope :publicadas, where(:publicada => true).order(:updated_at).reverse_order

  ##
  # Marca la Noticia como publicada para verse en la cartelera
  def publicar
    self.publicada = true
    self.save
  end

  ##
  # Marca la Noticia como despublicada quitandola de la cartelera
  def despublicar
    self.publicada = false
    self.save
  end
end
