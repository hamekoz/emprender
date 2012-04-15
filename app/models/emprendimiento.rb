class Emprendimiento < ActiveRecord::Base
  validates_presence_of :emprendedor,
                        :nombre,
                        :rubro,
                        :clasificacion,
                        :tipo,
                        :descripcion,
                        :cantidad_de_integrantes,
                        :roles,
                        :estado,
#                        :fecha_de_inicio_de_actividad,
#                        :web,
#                        :mail,
                        :domicilio,
                        :barrio,
                        :telefono,
                        :celular,
                        :telefono_de_mensajes,
#                        :comentarios,
#                        :es_monotributista,
#                        :es_monotributista_social,
#                        :fecha_de_inscripcion_al_monotributo,
#                        :situacion_frente_al_monotributo,
#                        :inscripto_en_ingresos_brutos,
#                        :fecha_de_inscripcion_ingresos_brutos,
#                        :recibe_ayuda_de_programas_sociales,
#                        :programas_sociales_recibidos,
#                        :tipo_de_ayuda_recibida_de_programas_sociales,
#                        :vinculado_a_sociedad_civil,
#                        :tipo_de_participacion_en_sociedad_civil,
#                        :recibio_ayuda_de_la_sociedad_civil,
#                        :justificacion_no_haber_recibido_ayuda_de_sociedad_civil,
                        :capacitaciones_recibidas,
                        :maquinarias_y_herramientas_utilizadas,
                        :produccion_mensual,
                        :produccion_anual,
                        :produccion_maxima,
#                        :dispone_de_espacio_fisico_para_produccion,
#                        :tipo_de_espacio,
#                        :posible_solucion_a_falta_de_espacio,
#                        :es_en_vivienda_particular,
#                        :siendo_en_vivienda_particular_el_espacio_es_suficiente,
#                        :es_necesario_acondicionamiento,
#                        :ocupa_lugares_destinados_a_otros_usos,
#                        :espacio_y_acondicinamiento_requeridos_para_crecer,
                        :caracteristicas_y_zonas_de_clientes_actuales,
                        :tipo_de_venta,
                        :productos_que_vende,
                        :cantidad_de_clientes_actuales,
                        :caracteristicas_y_zonas_de_futuros_clientes
#                        :competencia_en_mismo_barrio
#                        :descripcion_de_competencia_en_mismo_barrio,
#                        :herramientas_necesarias,
#                        :maquinarias_necesarias,
#                        :movilidad_necesaria,
#                        :insumos_necesarios,
#                        :instalaciones_necesarias,
#                        :capacitaciones_necesaria,
#                        :otras_necesidades,
#                        :observaciones

  belongs_to :emprendedor
  belongs_to :clasificacion
  belongs_to :categoria
  belongs_to :estado
  belongs_to :rubro
  belongs_to :barrio

  validates_associated :emprendedor
  validates_associated :clasificacion
  validates_associated :estado
  validates_associated :rubro
  validates_associated :barrio
  validates :mail, :uniqueness => true
  validates :mail, :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :web, :format => { :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix}
#validar el formato del mail y la web solo si estan presentes

  accepts_nested_attributes_for :emprendedor

  def tipo_enum
    ['Personal', 'Familiar', 'Asociativo']
  end

  def situacion_frente_al_monotributo_enum
    ['Al dia', 'Con deuda', 'Otra']
  end

  def tipo_de_espacio_enum
    ['Propio','Cedido','Alquilado','Otro']
  end

  def tipo_de_venta_enum
    ['Ferias', 'Locales Propios', 'Mayorista','Supermercados','En su casa','Distribuidores','Vendedores','Al estado','Otros']
  end
end
