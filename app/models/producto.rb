##
# Producto perteneciente a un Emprendimiento
class Producto < ActiveRecord::Base
  attr_accessible :descripcion,
                  :imagen_1, :delete_imagen_1,
                  :imagen_2, :delete_imagen_2,
                  :imagen_3, :delete_imagen_3,
                  :imagen_4, :delete_imagen_4,
                  :imagen_5, :delete_imagen_5,
                  :imagen_6, :delete_imagen_6,
                  :nombre, :activo, :aceptado,
                  :rubro_id, :rubro,
                  :tipo_de_venta, :precio,
                  :produccion_mensual, :produccion_anual, :produccion_maxima,
                  :emprendimiento_id, :emprendimiento

  scope :activos, where(:activo => true)
  scope :aceptados, where(:aceptado => true)
  scope :visibles, activos.merge(aceptados)

  validates_attachment :imagen_1, :imagen_2, :imagen_3, :imagen_4, :imagen_5, :imagen_6,
                       :content_type => { :content_type => ['image/gif',
                                                            'image/jpeg',
                                                            'image/pjpeg',
                                                            'image/png',
                                                            'image/tiff'] },
                       :size => { :in => 0..5.megabytes }


  validates_presence_of :emprendimiento, :nombre, :rubro, :tipo_de_venta, :precio
  validates_numericality_of :precio, :greater_than => 0

  ##
  # Verdadero si el Producto es visible en la Cartelera
  def visible
    activo && aceptado
  end

  ##
  # Marca el Producto como activo
  def activar
    self.activo = true
    self.save
  end

  ##
  # Marca el Producto como no activo
  def desactivar
    self.activo = false
    self.save
  end

  ##
  # Marca el Producto como aceptado
  def aceptar
    self.aceptado = emprendimiento.empadronado
    self.save
  end

  ##
  # Marca el Producto como no aceptado
  def rechazar
    self.aceptado = false
    self.save
  end

  belongs_to :emprendimiento
  belongs_to :rubro

  has_many :comentarios, :as => :comentable

  has_attached_file :imagen_1,
                    :default_url => "http://placehold.it/360x268&text=imagen",
                    :styles => { :mini => "160x120#", :normal => "360x268#" }
  has_attached_file :imagen_2,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen_3,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen_4,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen_5,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }
  has_attached_file :imagen_6,
                    :default_url => "http://placehold.it/160x120&text=imagen",
                    :styles => { :mini => "160x120#" }

  ##
  # Atributo para marcar como eliminada la imagen
  attr_accessor :delete_imagen_1, :delete_imagen_2, :delete_imagen_3,
                :delete_imagen_4, :delete_imagen_5, :delete_imagen_6

  before_validation { self.imagen_1.clear if self.delete_imagen_1 == '1' }
  before_validation { self.imagen_2.clear if self.delete_imagen_2 == '1' }
  before_validation { self.imagen_3.clear if self.delete_imagen_3 == '1' }
  before_validation { self.imagen_4.clear if self.delete_imagen_4 == '1' }
  before_validation { self.imagen_5.clear if self.delete_imagen_5 == '1' }
  before_validation { self.imagen_6.clear if self.delete_imagen_6 == '1' }

  ##
  # == Enumerado
  # Posibles valores del atributo tipo_de_venta
  def tipo_de_venta_enum
    ['Ferias', 'Locales Propios', 'Mayorista','Supermercados','En su casa','Distribuidores','Vendedores','Al estado', 'Internet', 'Otros']
  end
end
