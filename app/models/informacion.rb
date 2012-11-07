##
# Define una entrada de la Informacion correspondiente a la pagina Acerca
class Informacion < ActiveRecord::Base
  attr_accessible :orden, :subtitulo, :texto, :titulo, :visible

  validates_presence_of :orden, :titulo, :texto
  validates_uniqueness_of :orden

  scope :visibles, where(:visible => true).order(:orden)

  ##
  # Marca como publicada la Informacion
  def publicar
    self.visible = true
    self.save
  end

  ##
  # Marca como despublicada la Informacion
  def despublicar
    self.visible = false
    self.save
  end
end
