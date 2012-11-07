##
# Categoria de los emprendimientos.
# Se utiliza para categorizar un Emprendimiento
# un Emprendimiento
class Categoria < ActiveRecord::Base
  attr_accessible :nombre, :descripcion

  has_many :emprendimientos

  validates :nombre,
            :presence => true,
            :uniqueness => true
  validates :descripcion,
            :presence => true
end
