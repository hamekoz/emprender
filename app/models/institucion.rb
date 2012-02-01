class Institucion < ActiveRecord::Base
  validates :nombre, :presence=>true
  validates :descripcion, :presence=>true

  belongs_to :barrio
  
#  has_and_belong_to_many :representantes, :class_name => 'Persona'
end
