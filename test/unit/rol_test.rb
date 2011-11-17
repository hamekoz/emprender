require 'test_helper'

class RolTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "deberia crear rol" do
    rol = Rol.new

    rol.nombre = "Invitado"
    rol.descripcion = "Rol de prueba"

    assert rol.save
  end

  test "falla crear rol sin descripcion" do
    rol = Rol.new

    rol.nombre = "Invitado"

    assert !rol.save
  end

  test "deberia actualizar rol" do
    rol = roles(:Normal)

    rol.descripcion = "Rol de prueba"

    assert rol.save
  end
end
