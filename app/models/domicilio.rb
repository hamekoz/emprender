class Domicilio < ActiveRecord::Base
  validates 	:calle,  :presence => true

  belongs_to :barrio
end
