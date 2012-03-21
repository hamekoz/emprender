class Emprendedor < ActiveRecord::Base
  validates_presence_of :usuario, :domicilio, :telefono, :nivel_de_estudios_alcanzado

  belongs_to :usuario
  belongs_to :barrio

  accepts_nested_attributes_for :usuario

  def relacion_laboral_enum
    ['Dependiente', 'Independiente']
  end

  def nivel_de_estudios_alcanzado_enum
    ['Primario', 'Secundario', 'Terciario', 'Universitario']
  end

end
