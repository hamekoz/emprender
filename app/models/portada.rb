##
# Portada se corresponde a la foto e informacion de una instancia del carusel de
# fotos de la pagina principal
class Portada < ActiveRecord::Base
  attr_accessible :foto, :texto, :titulo, :visible

  validates_presence_of :foto, :texto, :titulo

  scope :visibles, where(:visible => true)

  has_attached_file :foto,
                    :default_url => "1000x450-portada.gif",
                    :styles => {:normal => ["1000x450\!", :png], :thumb => ["400x180>", :png] }

  validates_attachment :foto, :presence => true,
                       :content_type => { :content_type => ['image/gif',
                                                            'image/jpeg',
                                                            'image/pjpeg',
                                                            'image/png',
                                                            'image/tiff'] },
                       :size => { :in => 0..5.megabytes }

  ##
  # Permite marcar como elimianada la foto
  attr_accessor :delete_foto

  before_validation { self.foto.clear if self.delete_foto == '1' }

  ##
  # Marca como publicada la Portada mostrandola en el carusel de fotos
  def publicar
    self.visible = true
    self.save
  end

  ##
  # Marca como despublicada la Portada quitandola en el carusel de fotos
  def despublicar
    self.visible = false
    self.save
  end
end
