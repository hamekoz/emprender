##
# Estado de un Emprendimiento
class Estado < ActiveRecord::Base
  attr_accessible :nombre, :descripcion

  has_many :emprendimientos

  validates :nombre, :presence => true, :uniqueness => true

end
