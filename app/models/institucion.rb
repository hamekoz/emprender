##
# Institucion colaboradora en la promocion de la economia social
class Institucion < ActiveRecord::Base
  # attr_accessible :nombre, :descripcion, :barrio, :barrio_id,
  #                 :domicilio, :telefono, :visible, :web, :mail

  validates :nombre, :presence=>true
  validates :descripcion, :presence=>true

  belongs_to :barrio

  has_many :administradores
  has_many :representantes
  has_many :emprendedores

  scope :visibles, -> { where(visible: true) }

  ##
  # Marca como publicada la Institucion para que se muestre en la pagina Acerca
  def publicar
    self.visible = true
    self.save
  end

  ##
  # Marca como despublicada la Institucion para que NO se muestre en la pagina Acerca
  def despublicar
    self.visible = false
    self.save
  end
end
