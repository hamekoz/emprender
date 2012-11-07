##
# Perfil del Emprendedor
class Perfil < ActiveRecord::Base
#TODO definir attr_accessible

  before_update :limpiar_valores

  belongs_to :emprendedor, :inverse_of => :perfil
  belongs_to :barrio

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
                  :explicacion_de_ingresos

  validates :emprendedor_id,
            :uniqueness => true,
            :on => :update,
            :presence => true

  validates :dni,
            :on => :update,
            :allow_blank => true,
            :numericality => true,
            :uniqueness => true,
            :length => { :maximum => 8 }

  validates :cuit_cuil,
            :on => :update,
            :allow_blank => true,
            :uniqueness => true,
            :length => { :maximum => 13 },
            :format => { :with => /^\d{2}\-\d{8}\-\d{1}$/,
                         :message => "el formato debe ser ??-????????-?" }

  validates :cantidad_de_horas_semanales,
            :on => :update,
            :allow_blank => true,
            :numericality => { :only_integer => true,
                               :greater_than => 0,
                               :less_than => 100 }

  validates :plan_social,
            :on => :update,
            :presence => true,
            :if => :recibe_o_recibio_algun_plan_social?

  validates :fecha_de_recepcion,
            :on => :update,
            :presence => true,
            :if => :recibe_o_recibio_algun_plan_social?

  validates :telefono_particular,
            :telefono_celular,
            :telefono_para_mensajes,
            :on => :update,
            :allow_blank => true,
            :uniqueness => true,
            :numericality => true,
            :length => { :in => 7..9 }

  ##
  # == Enumerado
  # Posibles valores del atributo relacion_laboral
  def relacion_laboral_enum
    ['Dependiente', 'Independiente']
  end

  ##
  # == Enumerado
  # Posibles valores del atributo nivel_de_estudios
  def nivel_de_estudios_enum
    ['Primario', 'Secundario', 'Terciario', 'Universitario']
  end

  ##
  # Devuelte el progreso en el completado de datos del Perfil
  def progreso
    (atributos - atributos_incompletos) * 100 / atributos
  end

  ##
  # Verdadero si el Perfil esta completo
  def completo?
    progreso == 100
  end

  ##
  # Nombre visible del Perfil, corresponde al cuit_cuil
  def etiqueta
    cuit_cuil
  end

  private
    ##
    # Calcula la cantidad de atributos del Perfil segun atributos condicionales
    def atributos
      cantidad = 16
      cantidad -= 2 if recibe_o_recibio_algun_plan_social.blank?
      cantidad -= 1 if es_unico_ingreso? || es_unico_ingreso.nil?
      return cantidad
    end

    ##
    # Calcula la cantidad de atributos incompletos del Perfil segun atributos condicionales
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

    ##
    # Establece a nil los atributos que estan condicionados al valor de un
    # atributo condicionante
    def limpiar_valores
      self.explicacion_de_ingresos = nil if es_unico_ingreso?
      self.plan_social = nil unless recibe_o_recibio_algun_plan_social?
      self.fecha_de_recepcion = nil unless recibe_o_recibio_algun_plan_social?
    end
end
