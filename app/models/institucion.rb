class Institucion < ActiveRecord::Base
  validates :nombre, :presence=>true
  validates :descripcion, :presence=>true

  belongs_to :barrio

  has_many :administradores
  has_many :representantes
  has_many :emprendedores

  scope :visibles, where(:visible => true)

  def publicar
    self.visible = true
    self.save
  end

  def despublicar
    self.visible = false
    self.save
  end
end
