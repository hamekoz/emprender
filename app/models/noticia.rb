class Noticia < ActiveRecord::Base
  validates_presence_of :titulo, :resumen, :texto, :autor

  belongs_to :autor, :class_name => 'Usuario'

  has_many :comentarios, :as => :comentable

  scope :publicadas, where(:publicada => true).order(:updated_at).reverse_order

  def publicar
    self.publicada = true
    self.save
  end

  def despublicar
    self.publicada = false
    self.save
  end
end
