require 'test_helper'

class BarrioTest < ActiveSupport::TestCase
  test "unicidad" do
    barrio1 = barrios(:Normal)
    barrio2 = Barrio.new
    barrio2.nombre = barrio1.nombre
    barrio2.descripcion = barrio2.descripcion

    assert !barrio2.save
  end
end
