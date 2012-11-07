##
# Representa un elance a otro sitio o archivo de interes que se puede agregar
# en la pagina Acerca
class Vinculo < ActiveRecord::Base
  attr_accessible :nombre, :url, :visible

  validates_presence_of :nombre, :url

  validates :url,
            :uniqueness => true,
            :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  scope :visibles, where(:visible => true)

  ##
  # Marca el vinculo como publicado para ser mostrado en la pagina Acerca
  # Establece el atributo visible con valor verdadero
  def publicar
    self.visible = true
    self.save
  end

  ##
  # Marca el vinculo como no publicado para no se mostrado en la pagina Acerca
  # Establece el atributo visible con valor falso
  def despublicar
    self.visible = false
    self.save
  end
end
