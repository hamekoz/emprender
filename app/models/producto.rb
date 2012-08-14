class Producto < ActiveRecord::Base
  attr_accessible :descripcion,
                  :imagen1, :delete_imagen1,
                  :imagen2, :delete_imagen2,
                  :imagen3, :delete_imagen3,
                  :imagen4, :delete_imagen4,
                  :imagen5, :delete_imagen5,
                  :imagen6, :delete_imagen6,
                  :nombre, :activo,
                  :rubro_id, :rubro,
                  :tipo_de_venta, :precio,
                  :produccion_mensual, :produccion_anual, :produccion_maxima,
                  :emprendimiento_id, :emprendimiento

  scope :activos, where(:activo => true)
  scope :moderados, where(:moderado => true)

  belongs_to :emprendimiento
  belongs_to :rubro

  has_many :comentarios, :as => :comentable

  has_attached_file :imagen1,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#", :normal => "360x268#" }
  has_attached_file :imagen2,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen3,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen4,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen5,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen6,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }

  attr_accessor :delete_imagen1, :delete_imagen2, :delete_imagen3,
                :delete_imagen4, :delete_imagen5, :delete_imagen6

  before_validation { self.imagen1.clear if self.delete_imagen1 == '1' }
  before_validation { self.imagen2.clear if self.delete_imagen2 == '1' }
  before_validation { self.imagen3.clear if self.delete_imagen3 == '1' }
  before_validation { self.imagen4.clear if self.delete_imagen4 == '1' }
  before_validation { self.imagen5.clear if self.delete_imagen5 == '1' }
  before_validation { self.imagen6.clear if self.delete_imagen6 == '1' }

  def tipo_de_venta_enum
    ['Ferias', 'Locales Propios', 'Mayorista','Supermercados','En su casa','Distribuidores','Vendedores','Al estado', 'Internet', 'Otros']
  end
  
  def activar
    self.activo = true
    self.save
  end
end
