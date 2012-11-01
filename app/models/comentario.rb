class Comentario < ActiveRecord::Base
  attr_accessible :comentable, :comentable_id,
                  :texto,
                  :aceptado, :comentable_type
  belongs_to :comentable, :polymorphic => true

  validates_presence_of :texto, :comentable
  validates_associated :comentable

  scope :aceptados, where(:aceptado => true).order(:created_at)
  scope :pendientes, where(:aceptado => false).order(:created_at)

  def aceptar
    self.aceptado = true
    self.save
  end
  def rechazar
    self.aceptado = false
    self.save
  end
  
  def etiqueta
    texto
  end
end
