class Persona < ActiveRecord::Base
  validates :nombre, :presence => true
  validates :apellido, :presence => true

  def sexo_enum
    ['Femenino', 'Masculino']
  end

# Muestra nombre descriptivo en RailsAdmin
  def etiqueta
    nombre_completo
  end

  def nombre_completo
    "#{nombre} #{apellido}"
  end

  def nombre_completo_inverso
    "#{apellido}, #{nombre}"
  end
end
