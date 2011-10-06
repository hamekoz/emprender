class Domicilio < ActiveRecord::Base
  validates 	:barrio,  :presence => true
  validates 	:calle,  :presence => true
  validates 	:numero,  :presence => true

  belongs_to :barrio
end
