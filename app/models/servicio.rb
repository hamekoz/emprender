class Servicio < ActiveRecord::Base
  attr_accessible :descripcion, 
                  :imagen1, :imagen2, :imagen3, :imagen4, :imagen5, :nombre, :activo, :rubro, :rubro_id
  scope :activos, where(:activo => true)

  belongs_to :emprendedor
  belongs_to :rubro

  has_many :comentarios, :as => :comentable
end
