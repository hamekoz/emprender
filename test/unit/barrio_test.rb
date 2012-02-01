require 'test_helper'

class BarrioTest < ActiveSupport::TestCase
  #testea que no se pueda grabar un barrio cuyo nombre ya exista en la base de datos
  test "unicidad_nombre" do
    barrio1 = barrios(:normal)
    barrio2 = Barrio.new
    assert barrio1.save
    barrio2.nombre = barrio1.nombre
    barrio2.descripcion = barrio1.descripcion
    assert !barrio2.save
  end

  #testea que no se pueda grabar un barrio cuyo nombre esta en blanco
  test "presencia_nombre" do
    barrio1 = barrios(:sin_nombre)
    assert barrio1.nombre.blank?
    assert !barrio1.save
  end
end
