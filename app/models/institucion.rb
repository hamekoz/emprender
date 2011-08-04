class Institucion < ActiveRecord::Base
  validates :nombre, :presence => true, :uniqueness => true
  validates :descripcion, :presence => true
  validates :domicilio, presence => true
  
  has_and_belongs_to_many :usuarios
end
