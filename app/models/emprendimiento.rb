class Emprendimiento < ActiveRecord::Base
  before_update :limpiar_valores

  belongs_to :emprendedor
  belongs_to :clasificacion
  belongs_to :categoria
  belongs_to :estado
  belongs_to :rubro
  belongs_to :barrio
  
  has_many :productos
  has_many :servicios

  has_many :comentarios, :as => :comentable

  scope :empadronados, where(:empadronado => true)

  def aceptar
    self.empadronado = true
    self.save
  end

  def rechazar
    self.empadronado = false
    self.save
  end

  has_attached_file :logotipo, :default_url => "http://placehold.it/120&text=logo",
                               :styles => { :medium => "300x300>" }
  attr_accessor :delete_logotipo
  before_validation { self.logotipo.clear if self.delete_logotipo == '1' }

#Validaciones
  validates_presence_of :emprendedor

  validates :nombre,
            :on => :update,
            :presence => true

  validates :web,
            :on => :update,
            :allow_blank => true,
            :uniqueness => true,
            :format => { :with => /(^$)|(^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

  validates :mail,
            :on => :update,
            :allow_blank => true,
            :uniqueness => true,
            :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

  validates :cantidad_de_integrantes,
            :on => :update,
            :allow_blank => true,
            :numericality => { :only_integer => true,
                               :greater_than => 0,
                               :less_than => 21 }

  validates :cantidad_de_clientes_actuales,
            :on => :update,
            :allow_blank => true,
            :numericality => { :only_integer => true,
                               :greater_than => 0 }

  validates :fecha_de_inicio_de_actividad,
            :fecha_de_inscripcion_al_iva,
            :fecha_de_inscripcion_ingresos_brutos,
            :on => :update,
            :allow_blank => true,
            :date => { :before => Time.now }

  validates :telefono,
            :celular,
            :telefono_de_mensajes,
            :on => :update,
            :allow_blank => true,
            :uniqueness => true,
            :numericality => true,
            :length => { :in => 7..9 }

#Enumerados
  def tipo_enum
    ['Personal', 'Familiar', 'Asociativo']
  end

  def condicion_frente_al_iva_enum
    ['No inscripto', 'Monotributista Social', 'Monotributista', 'Responsable Inscripto']
  end

  def situacion_frente_al_iva_enum
    ['Al dia', 'Con deuda', 'Otra']
  end

  def tipo_de_espacio_enum
    ['Propio','Cedido','Alquilado','Otro']
  end

#Funciones publicas
  def progreso
    (atributos - atributos_incompletos) * 100 / atributos
  end

  def completo?
    progreso == 100
  end

  def inscripto_al_iva?
    !condicion_frente_al_iva.nil? && !condicion_frente_al_iva.blank? && condicion_frente_al_iva != 'No inscripto'
  end

#Funciones Privadas
  private
    def atributos
      cantidad = 43
      cantidad -= 2 if !inscripto_al_iva?
      cantidad -= 1 if inscripto_en_ingresos_brutos.blank?
      cantidad -= 3 if vinculado_a_sociedad_civil.blank?
      cantidad -= 1 if vinculado_a_sociedad_civil? && recibio_ayuda_de_la_sociedad_civil?
      cantidad -= 1 if dispone_de_espacio_fisico.nil?
      cantidad -= 6 if dispone_de_espacio_fisico.blank?
      cantidad -= 3 if dispone_de_espacio_fisico? && es_en_vivienda_particular.blank?
      cantidad -= 1 if competencia_en_mismo_barrio.blank?
      return cantidad
    end

    def atributos_incompletos
      cantidad = 0
      cantidad += 1 if nombre.blank?
      cantidad += 1 if es_marca_registrada.nil?
      cantidad += 1 if marca.blank?
      cantidad += 1 if rubro_id.blank?
      cantidad += 1 if tipo.blank?
      cantidad += 1 if descripcion.blank?
      cantidad += 1 if cantidad_de_integrantes.blank?
      cantidad += 1 if roles.blank?
      cantidad += 1 if estado_id.blank?
      cantidad += 1 if fecha_de_inicio_de_actividad.blank?
      cantidad += 1 if web.blank?
      cantidad += 1 if mail.blank?
      cantidad += 1 if domicilio.blank?
      cantidad += 1 if barrio_id.blank?
      cantidad += 1 if telefono.blank?
      cantidad += 1 if celular.blank?
      cantidad += 1 if telefono_de_mensajes.blank?
      cantidad += 1 if comentario.blank?
      cantidad += 1 if condicion_frente_al_iva.blank?
      if inscripto_al_iva?
        cantidad += 1 if fecha_de_inscripcion_al_iva.blank?
        cantidad += 1 if situacion_frente_al_iva.blank?
      end
      cantidad += 1 if inscripto_en_ingresos_brutos.nil?
      cantidad += 1 if fecha_de_inscripcion_ingresos_brutos.blank? && inscripto_en_ingresos_brutos?
      cantidad += 1 if recibe_ayuda_de_programas_sociales.nil?
      cantidad += 1 if tipo_de_ayuda_recibida_de_programas_sociales.blank? && recibe_ayuda_de_programas_sociales?
      cantidad += 1 if vinculado_a_sociedad_civil.nil?
      if vinculado_a_sociedad_civil?
        cantidad += 1 if tipo_de_participacion_en_sociedad_civil.blank?
        cantidad += 1 if recibio_ayuda_de_la_sociedad_civil.nil?
        cantidad += 1 if justificacion_no_haber_recibido_ayuda_de_sociedad_civil.blank? && recibio_ayuda_de_la_sociedad_civil?
      end
      cantidad += 1 if capacitaciones_recibidas.blank?
      cantidad += 1 if maquinarias_y_herramientas_utilizadas.blank?
      cantidad += 1 if dispone_de_espacio_fisico.nil?
      cantidad += 1 if posible_solucion_a_falta_de_espacio.blank? && !dispone_de_espacio_fisico? && !dispone_de_espacio_fisico.nil?
      if dispone_de_espacio_fisico?
        cantidad += 1 if tipo_de_espacio.blank?
        cantidad += 1 if es_en_vivienda_particular.nil?
        if es_en_vivienda_particular?
          cantidad += 1 if siendo_en_vivienda_particular_el_espacio_es_suficiente.nil?
          cantidad += 1 if es_necesario_acondicionamiento.nil?
          cantidad += 1 if ocupa_lugares_destinados_a_otros_usos.nil?
        end
        cantidad += 1 if espacio_y_acondicinamiento_requeridos_para_crecer.blank?
      end
      cantidad += 1 if caracteristicas_y_zonas_de_clientes_actuales.blank?
      cantidad += 1 if cantidad_de_clientes_actuales.blank?
      cantidad += 1 if caracteristicas_y_zonas_de_futuros_clientes.blank?
      cantidad += 1 if competencia_en_mismo_barrio.nil?
      cantidad += 1 if descripcion_de_competencia_en_mismo_barrio.blank? && competencia_en_mismo_barrio?
      return cantidad
    end

    def limpiar_valores
      if !inscripto_al_iva?
        self.fecha_de_inscripcion_al_iva = nil
        self.situacion_frente_al_iva = nil
      end
      self.fecha_de_inscripcion_ingresos_brutos = nil if inscripto_en_ingresos_brutos.blank?
      if vinculado_a_sociedad_civil.blank?
        self.tipo_de_participacion_en_sociedad_civil = nil
        self.recibio_ayuda_de_la_sociedad_civil = nil
      end
      self.justificacion_no_haber_recibido_ayuda_de_sociedad_civil = nil if recibio_ayuda_de_la_sociedad_civil.nil? || recibio_ayuda_de_la_sociedad_civil?
      if dispone_de_espacio_fisico.blank?
        self.tipo_de_espacio = nil
        self.es_en_vivienda_particular = nil
        self.espacio_y_acondicinamiento_requeridos_para_crecer = nil
      end
      if es_en_vivienda_particular.blank?
        self.siendo_en_vivienda_particular_el_espacio_es_suficiente = nil
        self.es_necesario_acondicionamiento = nil
        self.ocupa_lugares_destinados_a_otros_usos = nil
      end
      self.posible_solucion_a_falta_de_espacio = nil if dispone_de_espacio_fisico? || dispone_de_espacio_fisico.nil?
    end
end
