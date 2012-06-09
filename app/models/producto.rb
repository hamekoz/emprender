class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :imagen, :delete_imagen,
                  :imagen1, :imagen2, :imagen3, :imagen4, :imagen5, :nombre, :activo, :rubro, :rubro_id,
                  :tipo_de_venta, :precio, :produccion_mensual, :produccion_anual, :produccion_maxima
  scope :activos, where(:activo => true)
  
  belongs_to :emprendedor
  belongs_to :rubro

  has_many :comentarios, :as => :comentable

  has_attached_file :imagen
  attr_accessor :delete_imagen
  before_validation { self.imagen.clear if self.delete_imagen == '1' }
end
