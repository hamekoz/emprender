require 'test_helper'

class NoticiaTest < ActiveSupport::TestCase
  #testea que no se pueda grabar una noticia cuyo titulo esta en blanco
  test "presencia_titulo" do
    noticia1 = noticias(:SinTitulo)
    assert noticia1.titulo.blank?
    assert !noticia1.save
  end
  #testea que no se pueda grabar una noticia cuyo texto esta en blanco
  test "presencia_texto" do
    noticia1 = barrios(:SinTexto)
    assert noticia1.texto.blank?
    assert !noticia1.save
  end
end
