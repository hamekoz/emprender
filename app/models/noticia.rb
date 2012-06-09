class Noticia < ActiveRecord::Base
  validates :resumen, :presence => true
  validates :titulo, :presence => true
  validates :texto,  :presence => true

  belongs_to :autor, :class_name => 'Usuario'

  has_many :comentarios, :as => :comentable

  scope :publicadas, where(:publicada => true).order(:updated_at).reverse_order
  
  def publicar
    self.publicada = true
    self.save
  end
end
