class Producto < ActiveRecord::Base
  attr_accessible :descripcion,
                  :imagen1, :imagen2, :imagen3, :imagen4, :imagen5, :nombre, :activo
  scope :activos, where(:activo => true)
  
  belongs_to :emprendedor

  has_many :comentarios, :as => :comentable
end
