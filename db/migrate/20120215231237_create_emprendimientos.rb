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
      t.boolean :tiene_monotributo
      t.boolean :tiene_monotributo_social
      t.date :fecha_de_inscripcion_al_monotributo
      t.string :situacion_del_monotributo
      t.boolean :inscripto_en_ingresos_brutos
      t.date :fecha_de_inscripcion_ingresos_brutos
      t.boolean :recibe_ayuda_social
      t.string :programas_sociales_recibidos
      t.string :tipo_de_ayuda_recibida_de_programas_sociales
      t.boolean :vinculado_a_sociedad_civil
      t.text :tipo_de_participacion_en_sociedad_civil
      t.boolean :recibio_ayuda_de_la_sociedad_civil
      t.boolean :justificacion_no_haber_recibido_ayuda_de_sociedad_civil
      t.text :descripcion_de_capacitaciones_recibidas
      t.text :descripcion_de_maquinarias_y_herramientas_utilizadas
      t.integer :produccion_mensual
      t.integer :produccion_anual
      t.integer :produccion_maxima
      t.boolean :posee_espacio_propio
      t.string :tipo_de_espacio
      t.string :posible_solucion_a_falta_de_espacio_propio
      t.boolean :siendo_en_vivienda_particular_el_espacio_es_suficiente
      t.boolean :es_necesario_acondicionamiento
      t.boolean :ocupa_lugares_destinados_a_otros_usos_como_dormitorios
      t.text :espacio_y_acondicinamiento_requeridos_para_crecer
      t.text :clientes_actuales_caracteristicas_y_zona
      t.string :tipo_de_venta
      t.integer :clientes_actuales_cantidad
      t.text :clientes_futuros_caracteristicas_y_zona
      t.boolean :competencia_en_mismo_barrio
      t.text :competencia_en_mismo_barrio_descripcion
      t.text :herramientas_necesarias_descripcion
      t.text :maquinarias_necesarias_descripcion
      t.text :movilidad_necesaria_descripcion
      t.text :insumos_necesarios_descripcion
      t.text :instalaciones_necesarias_descripcion
      t.text :capacitaciones_necesaria_descripcion
      t.text :otros
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
