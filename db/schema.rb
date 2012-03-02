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

  create_table "contactos", :force => true do |t|
    t.integer  "persona_id"
    t.string   "mail"
    t.string   "telefono"
    t.string   "telefono_mensajes"
    t.string   "comentarios"
    t.string   "celular"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "emprendedores", :force => true do |t|
    t.integer  "usuario_id"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.string   "telefono_fijo"
    t.string   "telefono_celular"
    t.string   "telefono_para_mensajes"
    t.string   "observaciones_de_telefonos"
    t.integer  "estudio_id"
    t.string   "cantidad_de_hijos"
    t.string   "plan_social"
    t.date     "vigencia_desde"
    t.date     "vigencia_hasta"
    t.string   "actividad_laboral_extra"
    t.string   "relacion_de_dependecia"
    t.string   "relacion_con_el_sector_del_emprendimiento"
    t.string   "cantidad_de_horas_laborales"
    t.string   "es_unico_ingreso"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "emprendedores", ["usuario_id"], :name => "index_emprendedores_on_usuario_id"

  create_table "emprendimientos", :force => true do |t|
    t.integer  "emprendedor_id"
    t.string   "nombre"
    t.boolean  "marca_registrada"
    t.string   "marca"
    t.integer  "rubro_id"
    t.integer  "clasificacion_id"
    t.string   "tipo"
    t.text     "descripcion"
    t.integer  "cantidad_de_integrantes"
    t.text     "roles"
    t.integer  "estado_id"
    t.integer  "contacto_id"
    t.date     "fecha_de_inicio_de_actividad"
    t.string   "web"
    t.string   "mail"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.string   "telefono"
    t.string   "celular"
    t.string   "telefono_mensajes"
    t.string   "comentarios"
    t.boolean  "monotributo"
    t.boolean  "monotributo_social"
    t.date     "monotributo_inscripcion"
    t.string   "monotributo_situacion"
    t.boolean  "ingresos_brutos"
    t.date     "inscripcion_a_ingresos_brutos"
    t.boolean  "ayuda_social_recibida"
    t.string   "programas_sociales_recibidos"
    t.string   "programas_sociales_ayuda_recibida_tipo"
    t.boolean  "sociedad_civil_vinculado"
    t.text     "sociedad_civil_tipo_participacion"
    t.boolean  "sociedad_civil_ayuda_recibida"
    t.boolean  "sociedad_civil_justificacion_noayuda"
    t.text     "capacitaciones_descripcion"
    t.text     "maquinarias_herramientas_descripcion"
    t.integer  "produccion_mensual"
    t.integer  "produccion_anual"
    t.integer  "produccion_maxima"
    t.boolean  "espacio_propio"
    t.string   "espacio_tipo"
    t.string   "espacio_solucion"
    t.boolean  "espacio_suficiente"
    t.boolean  "espacio_acondicionamiento"
    t.boolean  "espacio_invasivo"
    t.text     "espacio_acondicinamiento_necesarios"
    t.text     "clientes_actuales_caracteristicas_zona"
    t.string   "venta_tipo"
    t.integer  "clientes_actuales_cantidad"
    t.text     "clientes_futuros_caracteristicas_zona"
    t.boolean  "competencia_mismo_barrio"
    t.text     "competencia_mismo_barrio_descripcion"
    t.text     "herramientas_necesarias_descripcion"
    t.text     "maquinarias_necesarias_descripcion"
    t.text     "movilidad_necesaria_descripcion"
    t.text     "insumos_necesarios_descripcon"
    t.text     "instalaciones_necesarias_descripcion"
    t.text     "capacitacion_necesaria_descripcion"
    t.text     "otros"
    t.text     "observaciones"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
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

  create_table "estudios", :force => true do |t|
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
