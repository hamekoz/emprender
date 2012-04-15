class Emprendedor < ActiveRecord::Base
  validates_presence_of :usuario, :domicilio, :nivel_de_estudios
  validates_numericality_of :dni, :message => "Solo caracteres numericos"
  validates_numericality_of :cuit_cuil, :message => "Solo caracteres numericos"
  validates_numericality_of :cantidad_de_horas_semanales, :only_integer => true, :message=> "Solo caracteres numericos"
  #validates :titulo, :presence => true, :unless =>nivel_de_estudio:if => :titulo_estudio?

  def titulo_estudio?
    nivel_de_estudios :in ['Secundario', 'Terciario', 'Universitario']
  end
  
  def tiene_actividad?
    actividad_laboral_principal
  end

  belongs_to :usuario
  belongs_to :barrio

  accepts_nested_attributes_for :usuario

  def relacion_laboral_enum
    ['Dependiente', 'Independiente']
  end

  def nivel_de_estudios_enum
    ['Primario', 'Secundario', 'Terciario', 'Universitario']
  end

end
