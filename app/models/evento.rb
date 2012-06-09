class Evento < ActiveRecord::Base
  validates :lugar, :presence => true
  validates :nombre, :presence => true
  validates :fecha_y_hora_de_inicio, :presence => true

  belongs_to :barrio
  belongs_to :autor, :class_name => 'Usuario'
  belongs_to :organizador, :class_name => 'Institucion'

  has_many :comentarios, :as => :comentable

  attr_accessible :folleto,:delete_folleto, :descripcion, :lugar, :nombre, :barrio, :organizador, :barrio_id, :organizador_id, :tipo_id, :tipo, :fecha_y_hora_de_inicio, :fecha_y_hora_de_finalizacion,
                :autor_id, :autor
  

  has_attached_file :folleto
  attr_accessor :delete_folleto
  before_validation { self.folleto.clear if self.delete_folleto == '1' }

  scope :publicados, where(:publicado => true).order(:updated_at).reverse_order

  def resumen
   "#{tipo}. Organiza: #{organizador.nombre} el #{fecha_y_hora_de_inicio} hasta #{fecha_y_hora_de_finalizacion} a realizarse en #{lugar} barrio #{barrio.nombre}"
  end
  
  def mapa
    "http://maps.google.com/maps/api/staticmap?center=#{lugar},Mar%20del%20Plata,Buenos%20Aires&size=512x512&maptype=roadmap&sensor=false&markers=#{lugar},%20Mar%20del%20Plata,%20Buenos%20Aires"
  end

  def tipo_enum
    ['Capacitacion', 'Feria', 'Reunion']
  end
  
  def publicar
    self.publicado = true
    self.save
  end
end
