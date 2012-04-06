class CreateEmprendimientos < ActiveRecord::Migration
  def change
    create_table :emprendimientos do |t|
      t.references :emprendedor
      t.string :nombre
      t.boolean :es_marca_registrada
      t.string :marca
      t.references :rubro
      t.references :clasificacion
      t.string :tipo
      t.text :descripcion
      t.integer :cantidad_de_integrantes
      t.text :roles
      t.references :estado
      t.date :fecha_de_inicio_de_actividad
      t.string :web
      t.string :mail
      t.string :domicilio
      t.references :barrio
      t.string :telefono
      t.string :celular
      t.string :telefono_de_mensajes
      t.string :comentarios
      t.boolean :es_monotributista
      t.boolean :es_monotributista_social
      t.date :fecha_de_inscripcion_al_monotributo
      t.string :situacion_frente_al_monotributo
      t.boolean :inscripto_en_ingresos_brutos
      t.date :fecha_de_inscripcion_ingresos_brutos
      t.boolean :recibe_ayuda_de_programas_sociales
      t.string :programas_sociales_recibidos
      t.string :tipo_de_ayuda_recibida_de_programas_sociales
      t.boolean :vinculado_a_sociedad_civil
      t.text :tipo_de_participacion_en_sociedad_civil
      t.boolean :recibio_ayuda_de_la_sociedad_civil
      t.text :justificacion_no_haber_recibido_ayuda_de_sociedad_civil
      t.text :capacitaciones_recibidas
      t.text :maquinarias_y_herramientas_utilizadas
      t.integer :produccion_mensual
      t.integer :produccion_anual
      t.integer :produccion_maxima
      t.boolean :dispone_de_espacio_fisico_para_produccion
      t.string :tipo_de_espacio #SI
      t.text :posible_solucion_a_falta_de_espacio #NO
      
      t.boolean :es_en_vivienda_particular
      t.boolean :siendo_en_vivienda_particular_el_espacio_es_suficiente
      t.boolean :es_necesario_acondicionamiento
      t.boolean :ocupa_lugares_destinados_a_otros_usos
      t.text :espacio_y_acondicinamiento_requeridos_para_crecer
      t.text :caracteristicas_y_zonas_de_clientes_actuales
      t.string :tipo_de_venta
      t.text :productos_que_vende
      t.integer :cantidad_de_clientes_actuales
      t.text :caracteristicas_y_zonas_de_futuros_clientes
      t.boolean :competencia_en_mismo_barrio
      t.text :descripcion_de_competencia_en_mismo_barrio
      t.text :herramientas_necesarias
      t.text :maquinarias_necesarias
      t.text :movilidad_necesaria
      t.text :insumos_necesarios
      t.text :instalaciones_necesarias
      t.text :capacitaciones_necesaria
      t.text :otras_necesidades
      t.text :observaciones

      t.timestamps
    end
    add_index :emprendimientos, :emprendedor_id
    add_index :emprendimientos, :clasificacion_id
    add_index :emprendimientos, :estado_id
    add_index :emprendimientos, :rubro_id
    add_index :emprendimientos, :barrio_id
  end
end
