class Barrio < ActiveRecord::Base
  validates :nombre,
            :presence => true,
            :uniqueness => true

  has_many :eventos
  has_many :emprendimientos
  has_many :perfiles
  has_many :instituciones
end
