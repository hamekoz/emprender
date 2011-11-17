require 'test_helper'

class CategoriaTest < ActiveSupport::TestCase
  #testea que no se pueda grabar una categoria cuyo nombre ya exista en la base de datos
  test "unicidad_nombre" do
    categoria1 = categorias(:Normal)
    categoria2 = Barrio.new
    assert categoria1.save
    categoria2.nombre = categoria1.nombre
    categoria2.descripcion = categoria1.descripcion
    assert !categoria2.save
  end
  #testea que no se pueda grabar una categoria cuyo nombre esta en blanco
  test "presencia_nombre" do
    categoria1 = categorias(:SinNombre)
    assert categoria1.nombre.blank?
    assert !categoria1.save
  end
  #testea que no se pueda grabar una categoria con descripcion en blanco
  test "presencia_descripcion" do
    categoria1 = categorias(:SinDescripcion)
    assert categoria1.nombre.blank?
    assert !categoria1.save
  end
end
