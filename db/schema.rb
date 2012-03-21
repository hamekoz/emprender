# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120215231237) do

  create_table "barrios", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "clasificaciones", :force => true do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "emprendedores", :force => true do |t|
    t.integer  "usuario_id"
    t.string   "dni"
    t.string   "cuit_cuil"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.string   "telefono_particular"
    t.string   "telefono_celular"
    t.string   "telefono_para_mensajes"
    t.text     "observaciones_de_telefonos"
    t.string   "nivel_de_estudios_alcanzado"
    t.boolean  "estudios_completo"
    t.string   "titulo"
    t.boolean  "recibe_algun_plan_social"
    t.string   "plan_social"
    t.date     "fecha_de_recepcion"
    t.string   "actividad_laboral_principal"
    t.string   "relacion_laboral"
    t.integer  "cantidad_de_horas_semanales"
    t.boolean  "es_unico_ingreso"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "emprendedores", ["usuario_id"], :name => "index_emprendedores_on_usuario_id"

  create_table "emprendimientos", :force => true do |t|
    t.integer  "emprendedor_id"
    t.string   "nombre"
    t.boolean  "es_marca_registrada"
    t.string   "marca"
    t.integer  "rubro_id"
    t.integer  "clasificacion_id"
    t.string   "tipo"
    t.text     "descripcion"
    t.integer  "cantidad_de_integrantes"
    t.text     "roles"
    t.integer  "estado_id"
    t.date     "fecha_de_inicio_de_actividad"
    t.string   "web"
    t.string   "mail"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.string   "telefono"
    t.string   "celular"
    t.string   "telefono_de_mensajes"
    t.string   "comentarios"
    t.boolean  "tiene_monotributo"
    t.boolean  "tiene_monotributo_social"
    t.date     "fecha_de_inscripcion_al_monotributo"
    t.string   "situacion_del_monotributo"
    t.boolean  "inscripto_en_ingresos_brutos"
    t.date     "fecha_de_inscripcion_ingresos_brutos"
    t.boolean  "recibe_ayuda_social"
    t.string   "programas_sociales_recibidos"
    t.string   "tipo_de_ayuda_recibida_de_programas_sociales"
    t.boolean  "vinculado_a_sociedad_civil"
    t.text     "tipo_de_participacion_en_sociedad_civil"
    t.boolean  "recibio_ayuda_de_la_sociedad_civil"
    t.boolean  "justificacion_no_haber_recibido_ayuda_de_sociedad_civil"
    t.text     "descripcion_de_capacitaciones_recibidas"
    t.text     "descripcion_de_maquinarias_y_herramientas_utilizadas"
    t.integer  "produccion_mensual"
    t.integer  "produccion_anual"
    t.integer  "produccion_maxima"
    t.boolean  "posee_espacio_propio"
    t.string   "tipo_de_espacio"
    t.string   "posible_solucion_a_falta_de_espacio_propio"
    t.boolean  "siendo_en_vivienda_particular_el_espacio_es_suficiente"
    t.boolean  "es_necesario_acondicionamiento"
    t.boolean  "ocupa_lugares_destinados_a_otros_usos_como_dormitorios"
    t.text     "espacio_y_acondicinamiento_requeridos_para_crecer"
    t.text     "clientes_actuales_caracteristicas_y_zona"
    t.string   "tipo_de_venta"
    t.integer  "clientes_actuales_cantidad"
    t.text     "clientes_futuros_caracteristicas_y_zona"
    t.boolean  "competencia_en_mismo_barrio"
    t.text     "competencia_en_mismo_barrio_descripcion"
    t.text     "herramientas_necesarias_descripcion"
    t.text     "maquinarias_necesarias_descripcion"
    t.text     "movilidad_necesaria_descripcion"
    t.text     "insumos_necesarios_descripcion"
    t.text     "instalaciones_necesarias_descripcion"
    t.text     "capacitaciones_necesaria_descripcion"
    t.text     "otros"
    t.text     "observaciones"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "emprendimientos", ["barrio_id"], :name => "index_emprendimientos_on_barrio_id"
  add_index "emprendimientos", ["clasificacion_id"], :name => "index_emprendimientos_on_clasificacion_id"
  add_index "emprendimientos", ["emprendedor_id"], :name => "index_emprendimientos_on_emprendedor_id"
  add_index "emprendimientos", ["estado_id"], :name => "index_emprendimientos_on_estado_id"
  add_index "emprendimientos", ["rubro_id"], :name => "index_emprendimientos_on_rubro_id"

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "eventos", :force => true do |t|
    t.string   "tipo"
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "lugar"
    t.integer  "barrio_id"
    t.datetime "fecha_y_hora_de_inicio"
    t.datetime "fecha_y_hora_de_finalizacion"
    t.integer  "organizador_id"
    t.boolean  "publicado"
    t.datetime "fecha_de_publicacion"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "eventos", ["barrio_id"], :name => "index_eventos_on_barrio_id"
  add_index "eventos", ["organizador_id"], :name => "index_eventos_on_organizador_id"

  create_table "instituciones", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "telefono"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.integer  "autor_id"
    t.datetime "fecha"
    t.boolean  "publicada"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "personas", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "sexo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rubros", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.integer  "persona_id"
    t.string   "rol"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "email",              :default => "", :null => false
    t.string   "encrypted_password", :default => "", :null => false
  end

  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true

end
