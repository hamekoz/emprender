require 'test_helper'

class InstitucionTest < ActiveSupport::TestCase
  #testea que no se pueda grabar una institucion que no tenga nombre
  test "presencia_nombre" do
    institucion1 = instituciones(:SinNombre)
    assert institucion1.nombre.blank?
    assert !institucion1.save
  end
  #testea que no se pueda grabar una institucion sin descripcion
  test "presencia_descripcion" do
    institucion1= instituciones(:SinDescripcion)
    assert institucion1.nombre.blank?
    assert !institucion1.save
  end
end
