##
# Comentario es la entidad para realizar un comentario sobre otra entidad
# que acepte comentarios
class Comentario < ActiveRecord::Base
  # attr_accessible :comentable, :comentable_id, :comentable_type,
  #                 :texto, :aceptado

  belongs_to :comentable, :polymorphic => true

  validates_presence_of :texto, :comentable
  validates_associated :comentable

  scope :aceptados, -> { where(aceptado: true).order(:created_at) }
  scope :pendientes, -> { where(aceptado: false).order(:created_at) }

  ##
  # Marca el comentario como aceptado por un Administrador
  # Establece el atributo aceptado en verdadero
  def aceptar
    self.aceptado = true
    self.save
  end

  ##
  # Marca el comentario como rechazado por un Administrador
  # Establece el atributo aceptado en falso
  def rechazar
    self.aceptado = false
    self.save
  end

  ##
  # Devuelve el nombre visible del comentario
  def etiqueta
    texto
  end
end
