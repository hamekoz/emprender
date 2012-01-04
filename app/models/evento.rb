class Evento < ActiveRecord::Base
  validates :nombre, :presence=>true 
  validates :fecha_y_Hora_de_inicio, :presence=>true

  belongs_to :domicilio
  belongs_to :institucion

  accepts_nested_attributes_for :domicilio
  
  scope :publicados, where(:publicado => true)

  def tipo_enum
    ['Capacitacion', 'Feria', 'Reunion']
  end
end
