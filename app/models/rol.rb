##
# Rol corresponde a los posibles roles de los usuarios
class Rol
  ##
  # Nombre del Rol
  attr_reader :nombre
  
  ##
  # Devuelve todos los roles
  def self.all
    ['Emprendedor', 'Representante', 'Administrador' ].map { |rol| new(rol) }
  end

  ##
  # Inicializa un Rol
  def initialize(rol)
    @nombre = rol
  end

  ##
  # Devuelve los usuarios correspondientes al Rol actual
  def usuarios
    if @nombre == "Administrador"
      Administrador.all
    elsif @nombre == "Representante"
      Representante.all
    elsif @nombre == "Emprendedor"
      Emprendedor.all
    end
  end

  ##
  # Lista de roles del sistema
  def rol_enum
    ['Emprendedor', 'Representante', 'Administrador' ]
  end
end


