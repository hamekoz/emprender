class Emprendimiento < ActiveRecord::Base
  validates_presence_of :emprendedor, :nombre, :es_marca_registrada, :marca, :rubro
  validates_presence_of :clasificacion, :tipo, :descripcion, :cantidad_de_integrantes
  validates_presence_of :roles, :estado, :fecha_de_inicio_de_actividad
  validates_presence_of :web, :mail, :domicilio, :barrio, :telefono, :celular
  validates_presence_of :telefono_de_mensajes, :comentarios, :tiene_monotributo
  validates_presence_of :tiene_monotributo_social, :fecha_de_inscripcion_al_monotributo
  validates_presence_of :situacion_del_monotributo, :inscripto_en_ingresos_brutos
  validates_presence_of :fecha_de_inscripcion_ingresos_brutos, :recibe_ayuda_social
  validates_presence_of :programas_sociales_recibidos
  validates_presence_of :tipo_de_ayuda_recibida_de_programas_sociales
  validates_presence_of :vinculado_a_sociedad_civil
  validates_presence_of :tipo_de_participacion_en_sociedad_civil
  validates_presence_of :recibio_ayuda_de_la_sociedad_civil
  validates_presence_of :justificacion_no_haber_recibido_ayuda_de_sociedad_civil
  validates_presence_of :descripcion_de_capacitaciones_recibidas
  validates_presence_of :descripcion_de_maquinarias_y_herramientas_utilizadas
  validates_presence_of :produccion_mensual, :produccion_anual, :produccion_maxima
  validates_presence_of :posee_espacio_propio, :tipo_de_espacio
  validates_presence_of :posible_solucion_a_falta_de_espacio_propio
  validates_presence_of :siendo_en_vivienda_particular_el_espacio_es_suficiente
  validates_presence_of :es_necesario_acondicionamiento
  validates_presence_of :ocupa_lugares_destinados_a_otros_usos_como_dormitorios
  validates_presence_of :espacio_y_acondicinamiento_requeridos_para_crecer
  validates_presence_of :clientes_actuales_caracteristicas_y_zona
  validates_presence_of :tipo_de_venta, :clientes_actuales_cantidad
  validates_presence_of :clientes_futuros_caracteristicas_y_zona
  validates_presence_of :competencia_en_mismo_barrio
  validates_presence_of :competencia_en_mismo_barrio_descripcion
  validates_presence_of :herramientas_necesarias_descripcion
  validates_presence_of :maquinarias_necesarias_descripcion
  validates_presence_of :movilidad_necesaria_descripcion
  validates_presence_of :insumos_necesarios_descripcion
  validates_presence_of :instalaciones_necesarias_descripcion
  validates_presence_of :capacitaciones_necesaria_descripcion, :otros, :observaciones

  belongs_to :emprendedor
  belongs_to :clasificacion
  belongs_to :estado
  belongs_to :rubro
  belongs_to :barrio

  def rol_enum
    ['Personal', 'Familiar', 'Asociativo']
  end

  def monotributo_situacion_enum
    ['Al dia', 'Con deudas', 'Otros']
  end

  def produccion_espacio_propio_tipo_enum
    ['Propio','Cedido','Alquilado','Otro']
  end
  
  def venta_tipo_enum
    ['Ferias', 'Locales Propios', 'Mayorista','Supermercados','En su casa','Distribuidores','Vendedores','Al estado','Otros']
  end
end
