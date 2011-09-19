class Noticia < ActiveRecord::Base
  scope :publicadas, where("noticias.publicada = 1")
end
