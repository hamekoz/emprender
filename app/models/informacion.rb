class Informacion < ActiveRecord::Base
  attr_accessible :orden, :subtitulo, :texto, :titulo, :visible

  validates_presence_of :orden, :titulo, :texto
  validates_uniqueness_of :orden

  scope :visibles, where(:visible => true).order(:orden)

  def publicar
    self.visible = true
    self.save
  end

  def despublicar
    self.visible = false
    self.save
  end
end
