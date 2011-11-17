class Evento < ActiveRecord::Base
  validates :nombre, :presence=>true 
  validates :fechaHoraInicio, :presence=>true

  belongs_to :tipo_evento
  belongs_to :domicilio
  belongs_to :institucion

  accepts_nested_attributes_for :domicilio
  
  scope :publicados, where(:publicado => true)
end
