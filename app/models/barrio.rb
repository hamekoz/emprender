##
# Barrio correspondiente a un domicilio o lugar
class Barrio < ActiveRecord::Base
  # attr_accessible :nombre, :descripcion

  validates :nombre,
            :presence => true,
            :uniqueness => true

  has_many :eventos
  has_many :emprendimientos
  has_many :perfiles
  has_many :instituciones
end
