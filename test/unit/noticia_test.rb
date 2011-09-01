require 'test_helper'

class NoticiaTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "deberia crear noticia" do
    noticia = Noticia.new
    
    noticia = noticias[:uno]
  
    assert noticia.save
  end
end
