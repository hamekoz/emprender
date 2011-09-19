class Rol < ActiveRecord::Base
  validates :nombre, :presence => true, :uniqueness => true
  validates :descripcion, :presence => true

  has_many :usuarios

  default_scope order('roles.nombre')
  
  def administrador?
    return :id == 1
  end
  
  def emprendedor?
    return :id == 3
  end
  
  def institucion?
    return :id == 2
  end
end
