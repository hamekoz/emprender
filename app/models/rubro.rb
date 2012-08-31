class Rubro < ActiveRecord::Base
  attr_accessible :nombre, :descripcion

  validates :nombre, :presence => true, :uniqueness => true
end
