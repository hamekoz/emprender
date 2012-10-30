class Rubro < ActiveRecord::Base
  attr_accessible :nombre, :descripcion

  validates :nombre, :presence => true, :uniqueness => true
  
  has_many :emprendimientos
  has_many :productos
  has_many :servicios
end
