class Comentario < ActiveRecord::Base
  attr_accessible :comentable, :comentable_id,
                  :texto,
                  :aceptado, :comentable_type
  belongs_to :comentable, :polymorphic => true

  def aceptar
    self.moderado = true
    self.save
  end
  def rechazar
    self.moderado = false
    self.save
  end
end
