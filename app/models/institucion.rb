class Institucion < ActiveRecord::Base
  validates :nombre, :presence=>true
  validates :descripcion, :presence=>true

  belongs_to :domicilio
  belongs_to :telefono

  accepts_nested_attributes_for :domicilio, :telefono
end
