class Rol < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :descripcion, :presence => true

  has_many :usuarios

  default_scope order('roles.nombre')
end
