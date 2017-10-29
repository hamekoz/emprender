##
# Mensaje entre los Usuarios del sistema
class Mensaje < ActiveRecord::Base
  # attr_accessible :texto, :asunto, :remitente, :remitente_id, :destinatario, :destinatario_id, :leido,
  # :eliminado_destinatario, :eliminado_remitente

  validates :destinatario, :presence => true
  validates :asunto,       :presence => true
  validates :texto,        :presence => true
  
  belongs_to :remitente,    :class_name => 'Usuario'
  belongs_to :destinatario, :class_name => 'Usuario'

  scope :recibidos, -> { where(eliminado_destinatario: false).order(:created_at).reverse_order }
  scope :enviados, -> { where(eliminado_remitente: false).order(:created_at).reverse_order }

  scope :sin_leer, -> { where(leido: false) }

  scope :recibidos_eliminados, -> { where(eliminado_destinatario: true).order(:created_at).reverse_order }
  scope :enviados_eliminados, -> { where(eliminado_remitente: true).order(:created_at).reverse_order }

  ##
  # Devuelte la fecha en un formato amigable de acuerdo a la distancia de tiempo
  # entre la fecha del mensaje y la fecha actual
  def fecha
    if created_at.year != Date.today.year
      I18n.l(created_at, :format => :simple)
    elsif created_at.time > Time.now.midnight
      "Hoy #{I18n.l(created_at, :format => :mini)}"
    else
      I18n.l(created_at, :format => :short)
    end
  end
end
