class Documento < ActiveRecord::Base
  validates :nombre, :uniqueness => true
  validates :abreviatura, :presence =>true, :uniqueness => true
end
