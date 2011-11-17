require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  test "presencia_usuario" do
    usuarioPrueba = usuarios(:SinUsuario)
    assert !usuarioPrueba.usuario.blank?
  end
  test "unicidad_usuario" do
    usuarioPrueba.= usuarios(:Normal2)
    Usuario.find()
  
 test "puede crear usuario" do
   usuario = Usuario.new
   usuario = usuarios(:Normal)
   assert usuario.save
 end
end
