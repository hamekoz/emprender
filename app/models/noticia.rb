class Noticia < ActiveRecord::Base
  validates :titulo, :presence=>true
  validates :texto,  :presence=>true

  scope :publicadas, where(:publicada => true)
end
