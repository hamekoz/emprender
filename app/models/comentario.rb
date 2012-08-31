class Comentario < ActiveRecord::Base
  attr_accessible :comentable, :comentable_id,
                  :texto,
                  :aceptado, :comentable_type
  belongs_to :comentable, :polymorphic => true

  def aceptar
    self.aceptado = true
    self.save
  end
  def rechazar
    self.aceptado = false
    self.save
  end
end
