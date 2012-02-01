class Evento < ActiveRecord::Base
  validates :lugar, :presence => true
  validates :nombre, :presence => true
  validates :fecha_y_Hora_de_inicio, :presence => true

  belongs_to :barrio
  belongs_to :organizador, :class_name => 'Institucion'
  
  scope :publicados, where(:publicado => true)

  def tipo_enum
    ['Capacitacion', 'Feria', 'Reunion']
  end
end
