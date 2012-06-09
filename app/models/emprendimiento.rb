class Emprendimiento < ActiveRecord::Base
  belongs_to :emprendedor
  belongs_to :clasificacion
  belongs_to :categoria
  belongs_to :estado
  belongs_to :rubro
  belongs_to :barrio

  has_many :comentarios, :as => :comentable

#  validates_associated :emprendedor
#  validates_associated :clasificacion
#  validates_associated :estado
#  validates_associated :rubro
#  validates_associated :barrio
#  validates_numericality_of :cantidad_de_integrantes, :unless => :cantidad_de_integrantes.blank?
#  validates :mail, :uniqueness, :unless => :mail.blank?
#  validates :mail, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }, :unless => :mail.blank?
#  validates :web, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix} , :unless => :web.blank? 
#validar el formato del mail y la web solo si estan presentes

  def tipo_enum
    ['Personal', 'Familiar', 'Asociativo']
  end

  def situacion_frente_al_monotributo_enum
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
    attributes.count
  end

  def nulos
    attributes.values.select(&:nil?).count
  end
end
