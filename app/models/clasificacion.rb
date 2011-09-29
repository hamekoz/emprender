class Clasificacion < ActiveRecord::Base
  validates :nombre, :presence => true, :uniqueness => true
  validates :codigo, :presence => true, :uniqueness => true
end

