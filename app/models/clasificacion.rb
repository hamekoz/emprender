##
# Clasificacion de emprendimientos
# Se utiliza para clasificar un emprendimiento segun su CIIU
class Clasificacion < ActiveRecord::Base
  # attr_accessible :nombre, :descripcion, :codigo

  has_many :emprendimientos

  validates :nombre, :presence => true #, :uniqueness => true
  validates :codigo, :presence => true, :uniqueness => true
  
  def etiqueta
    codigo
  end
end

