class Perfil < ActiveRecord::Base
  belongs_to :emprendedor

  attr_accessible :emprendedor,
                  :dni,
                  :cuit_cuil,
                  :domicilio,
                  :barrio,
                  :barrio_id,
                  :telefono_particular,
                  :telefono_celular,
                  :telefono_para_mensajes,
                  :observaciones_de_telefonos,
                  :nivel_de_estudios,
                  :estudios_completos,
                  :titulo,
                  :recibe_o_recibio_algun_plan_social,
                  :plan_social,
                  :fecha_de_recepcion,
                  :actividad_laboral_principal,
                  :relacion_laboral,
                  :cantidad_de_horas_semanales,
                  :es_unico_ingreso,
                  :explicacion_de_ingresos,
                  :empadronado

#  validates_presence_of :domicilio, :nivel_de_estudios
#  validates_numericality_of :dni, :message => "Solo caracteres numericos"
#  validates_numericality_of :cuit_cuil, :message => "Solo caracteres numericos"
#  validates_numericality_of :cantidad_de_horas_semanales, :only_integer => true, :message=> "Solo caracteres numericos"
#  validates :titulo, :presence => true, :unless => :nivel_de_estudio =='Primario'
#  validates :cantidad_de_horas_semanales, :presence => true, :unless => :actividad_laboral_principal.blank?

  def titulo_estudio?
    nivel_de_estudios :in ['Secundario', 'Terciario', 'Universitario']
  end
  

  belongs_to :barrio

  def relacion_laboral_enum
    ['Dependiente', 'Independiente']
  end

  def nivel_de_estudios_enum
    ['Primario', 'Secundario', 'Terciario', 'Universitario']
  end

  def progreso
    (attributes.count - attributes.values.select(&:blank?).count) * 100 / attributes.count
  end

  def completo?
    attributes.count - attributes.values.select(&:blank?).count == 0
  end
end
