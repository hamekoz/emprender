class Institucion < ActiveRecord::Base
  validates :nombre, :presence=>true
  validates :descripcion, :presence=>true

  belongs_to :barrio

  has_many :administradores
  has_many :representantes
  has_many :emprendedores

end
