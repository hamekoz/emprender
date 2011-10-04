class Evento < ActiveRecord::Base
  validates :nombre, :presence=>true 
  validates :fechaHoraInicio, :presence=>true

  belongs_to :tipoEvento
  belongs_to :domicilio
  belongs_to :institucion

  accepts_nested_attributes_for :domicilio
end
