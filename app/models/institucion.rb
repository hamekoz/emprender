class Institucion < ActiveRecord::Base
  belongs_to :domicilio
  belongs_to :telefono

  accepts_nested_attributes_for :domicilio, :telefono
end
