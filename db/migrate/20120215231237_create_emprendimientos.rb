class CreateEmprendimientos < ActiveRecord::Migration
  def change
    create_table :emprendimientos do |t|
      t.references :emprendedor
      t.string :nombre
      t.boolean :marca_registrada
      t.string :marca
      t.references :rubro
      t.references :clasificacion
      t.string :tipo
      t.text :descripcion
      t.integer :cantidad_de_integrantes
      t.text :roles
      t.references :estado
      t.references :contacto
      t.date :fecha_de_inicio_de_actividad
      t.string :web
      t.string :mail
      t.string :domicilio
      t.references :barrio
      t.string :telefono
      t.string :celular
      t.string :telefono_mensajes
      t.string :comentarios
      t.boolean :monotributo
      t.boolean :monotributo_social
      t.date :monotributo_inscripcion
      t.string :monotributo_situacion
      t.boolean :ingresos_brutos
      t.date :inscripcion_a_ingresos_brutos
      t.boolean :ayuda_social_recibida
      t.string :programas_sociales_recibidos
      t.string :programas_sociales_ayuda_recibida_tipo
      t.boolean :sociedad_civil_vinculado
      t.text :sociedad_civil_tipo_participacion
      t.boolean :sociedad_civil_ayuda_recibida
      t.boolean :sociedad_civil_justificacion_noayuda
      t.text :capacitaciones_descripcion
      t.text :maquinarias_herramientas_descripcion
      t.integer :produccion_mensual
      t.integer :produccion_anual
      t.integer :produccion_maxima
      t.boolean :espacio_propio
      t.string :espacio_tipo
      t.string :espacio_solucion
      t.boolean :espacio_suficiente
      t.boolean :espacio_acondicionamiento
      t.boolean :espacio_invasivo
      t.text :espacio_acondicinamiento_necesarios
      t.text :clientes_actuales_caracteristicas_zona
      t.string :venta_tipo
      t.integer :clientes_actuales_cantidad
      t.text :clientes_futuros_caracteristicas_zona
      t.boolean :competencia_mismo_barrio
      t.text :competencia_mismo_barrio_descripcion
      t.text :herramientas_necesarias_descripcion
      t.text :maquinarias_necesarias_descripcion
      t.text :movilidad_necesaria_descripcion
      t.text :insumos_necesarios_descripcon
      t.text :instalaciones_necesarias_descripcion
      t.text :capacitacion_necesaria_descripcion
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
