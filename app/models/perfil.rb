class Perfil < ActiveRecord::Base
  belongs_to :emprendedor

  attr_accessible :emprendedor,
                  :emprendedor_id,
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

  before_update :limpiar_valores

  def limpiar_valores
    self.explicacion_de_ingresos = nil if es_unico_ingreso?
    self.plan_social = nil unless recibe_o_recibio_algun_plan_social?
    self.fecha_de_recepcion = nil unless recibe_o_recibio_algun_plan_social?
  end

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
    (atributos - atributos_incompletos) * 100 / atributos
  end

  def completo?
    progreso == 100
  end
  
#  private
  def atributos
    cantidad = 16
    cantidad -= 2 if recibe_o_recibio_algun_plan_social.blank?
    cantidad -= 1 if es_unico_ingreso? || es_unico_ingreso.nil?
    return cantidad
  end

  def atributos_incompletos
    cantidad = 0
    cantidad += 1 if dni.blank?
    cantidad += 1 if cuit_cuil.blank?
    cantidad += 1 if barrio_id.blank?
    cantidad += 1 if telefono_particular.blank?
    cantidad += 1 if telefono_celular.blank?
    cantidad += 1 if telefono_para_mensajes.blank?
    cantidad += 1 if observaciones_de_telefonos.blank?
    cantidad += 1 if nivel_de_estudios.blank?
    cantidad += 1 if estudios_completos.nil?
    cantidad += 1 if titulo.blank?
    cantidad += 1 if recibe_o_recibio_algun_plan_social.nil?
    cantidad += 1 if plan_social.blank? && recibe_o_recibio_algun_plan_social?
    cantidad += 1 if fecha_de_recepcion.blank? && recibe_o_recibio_algun_plan_social?
    cantidad += 1 if actividad_laboral_principal.blank? 
    cantidad += 1 if es_unico_ingreso.nil?
    cantidad += 1 if explicacion_de_ingresos.blank? && !es_unico_ingreso? && !es_unico_ingreso.nil?
    return cantidad
  end
end
