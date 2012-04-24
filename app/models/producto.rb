class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :imagen1, :imagen2, :imagen3, :imagen4, :imagen5, :nombre
  scope :activos, where(:activo => true)
end
