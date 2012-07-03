class Emprendimiento < ActiveRecord::Base
  belongs_to :emprendedor
  belongs_to :clasificacion
  belongs_to :categoria
  belongs_to :estado
  belongs_to :rubro
  belongs_to :barrio

  has_many :comentarios, :as => :comentable
  scope :empadronados, where(:empadronado => true)

  has_attached_file :logotipo, :default_url => "http://placehold.it/120&text=logo",
                               :styles => { :medium => "300x300>" }
  attr_accessor :delete_logotipo
  before_validation { self.logotipo.clear if self.delete_logotipo == '1' }

  validates :nombre, :presence => true, :on => :update
#  validate :mail,   :uniqueness => true, :unless => :mail.blank?
  
#  validates_associated :emprendedor

#  validates_numericality_of :cantidad_de_integrantes, :unless => :cantidad_de_integrantes.blank?

#  validates :mail, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }, :unless => :mail.blank?
#  validates :web, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix} , :unless => :web.blank? 

  def tipo_enum
    ['Personal', 'Familiar', 'Asociativo']
  end

  def condicion_frente_al_iva_enum
    ['No inscripto', 'Monotributista Social', 'Monotributista', 'Responsable Inscripto']
  end

  def inscripto_al_iva?
    !condicion_frente_al_iva.nil? && !condicion_frente_al_iva.blank? && condicion_frente_al_iva != 'No inscripto'
  end

  def situacion_frente_al_iva_enum
    ['Al dia', 'Con deuda', 'Otra']
  end

  def tipo_de_espacio_enum
    ['Propio','Cedido','Alquilado','Otro']
  end

  def tipo_de_venta_enum
    ['Ferias', 'Locales Propios', 'Mayorista','Supermercados','En su casa','Distribuidores','Vendedores','Al estado','Otros']
  end

  def progreso
    (attributes.count - attributes.values.select(&:blank?).count) * 100 / attributes.count
  end

  def completo?
    attributes.count - attributes.values.select(&:blank?).count == 0
  end
  
  def atributos
    cantidad = 0
    attributes.count - 5
  end

  def nulos
    attributes.values.select(&:nil?).count
  end
end
