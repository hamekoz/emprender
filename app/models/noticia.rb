class Noticia < ActiveRecord::Base
  validates :titulo, :presence => true
  validates :texto,  :presence => true

  belongs_to :autor, :class_name => 'Usuario'

  has_many :comentarios, :as => :comentable

  scope :publicadas, where(:publicada => true)
end
