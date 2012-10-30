class Rol
  attr_reader :nombre
  
  def self.all
    ['Emprendedor', 'Representante', 'Administrador' ].map { |rol| new(rol) }
  end

  def initialize(rol )
    @nombre = rol
  end

  def usuarios
    if @nombre == "Administrador"
      Administrador.all
    elsif @nombre == "Representante"
      Representante.all
    elsif @nombre == "Emprendedor"
      Emprendedor.all
    end
  end

  def rol_enum
    ['Emprendedor', 'Representante', 'Administrador' ]
  end
end


