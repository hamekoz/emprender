class Categoria < ActiveRecord::Base
  has_many :emprendimientos

  validates :nombre,
            :presence => true,
            :uniqueness => true
  validates :descripcion,
            :presence => true
end
