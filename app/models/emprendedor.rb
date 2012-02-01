class Emprendedor < ActiveRecord::Base
  validates_presence_of :usuario, :domicilio, :telefono, :estudio

  belongs_to :usuario
  belongs_to :barrio
  belongs_to :estudio

  accepts_nested_attributes_for :usuario

  def cantidad_de_hijos_enum
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  end

  def relacion_de_dependecia_enum
    ['Dependiente', 'Independiente']
  end

  def relacion_con_el_sector_del_emprendimiento_enum
    ['Completa', 'Parcial', 'Ninguna']
  end

  def cantidad_de_horas_laborales_enum
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
  end

  def es_unico_ingreso_enum
    ['Si', 'No']
  end
end
