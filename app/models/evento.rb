##
# Evento permite crear y publicar eventos que se organicen para promover la
# economia social
class Evento < ActiveRecord::Base
  attr_accessible :nombre, :descripcion, :lugar, :domicilio, :barrio,
                  :organizador, :barrio_id, :organizador_id, :tipo_id, :tipo,
                  :fecha_y_hora_de_inicio, :fecha_y_hora_de_finalizacion,
                  :autor_id, :autor, :folleto,:delete_folleto, :publicado

  validates_presence_of :nombre, :tipo, :domicilio, :barrio, :fecha_y_hora_de_inicio,
                        :fecha_y_hora_de_finalizacion, :autor, :organizador

  belongs_to :barrio
  belongs_to :autor,       :class_name => 'Usuario'
  belongs_to :organizador, :class_name => 'Institucion'

  has_many :comentarios,   :as => :comentable

  validates_attachment :folleto,
                       :content_type => { :content_type => ['image/gif',
                                                            'image/jpeg',
                                                            'image/pjpeg',
                                                            'image/png',
                                                            'image/tiff'] },
                       :size => { :in => 0..5.megabytes }


  has_attached_file :folleto,
                    :default_url => "http://placehold.it/400x600&text=imagen",
                    :styles => { :mini => "175x250#", :normal => "400x600#" }

  # Permite marcar como elimiando el folleto del Evento
  attr_accessor :delete_folleto
  before_validation { self.folleto.clear if self.delete_folleto == '1' }

  ##
  # Devuelve una cadena resumiendo la informacion del evento
  def resumen
   "#{tipo}. Organiza: #{organizador.nombre} el #{fecha_y_hora_de_inicio} hasta #{fecha_y_hora_de_finalizacion} a realizarse en #{lugar} #{domicilio} barrio #{barrio.nombre}"
  end

  ##
  # Devuelve la ruta al mapa en google maps correspondiente al evento, buscando
  # en la ciudad de Mar del Plata de acuerdo al lugar indicado
  def mapa
    "http://maps.google.com/maps/api/staticmap?center=#{domicilio},Mar%20del%20Plata,Buenos%20Aires&size=512x512&maptype=roadmap&sensor=false&markers=#{domicilio},%20Mar%20del%20Plata,%20Buenos%20Aires"
  end

  ##
  # == Enumerado
  # Devuelve los posibles valores del atributo tipo
  def tipo_enum
    ['Capacitacion', 'Feria', 'Reunion']
  end
  
  scope :publicados, where(:publicado => true).order(:updated_at).reverse_order

  ##
  # Marca el Evento como publicado
  def publicar
    self.publicado = true
    self.save
  end

  ##
  # Desmarca el Evento como publicado
  def despublicar
    self.publicado = false
    self.save
  end
end
