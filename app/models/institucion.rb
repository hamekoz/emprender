class Institucion < ActiveRecord::Base

  belongs_to :telefono
  belongs_to :domicilio

end
