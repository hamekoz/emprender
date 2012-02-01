class Noticia < ActiveRecord::Base
  validates :titulo, :presence => true
  validates :texto,  :presence => true

  belongs_to :autor, :class_name => 'Persona'

  scope :publicadas, where(:publicada => true)
end
