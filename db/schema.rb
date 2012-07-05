# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120515003533) do

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

  create_table "comentarios", :force => true do |t|
    t.text     "texto"
    t.integer  "comentable_id"
    t.string   "comentable_type"
    t.boolean  "moderado"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "emprendimientos", :force => true do |t|
    t.integer  "emprendedor_id"
    t.string   "logotipo_file_name"
    t.string   "logotipo_content_type"
    t.integer  "logotipo_file_size"
    t.datetime "logotipo_updated_at"
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
    t.string   "comentario"
    t.string   "condicion_frente_al_iva"
    t.date     "fecha_de_inscripcion_al_iva"
    t.string   "situacion_frente_al_iva"
    t.boolean  "inscripto_en_ingresos_brutos"
    t.date     "fecha_de_inscripcion_ingresos_brutos"
    t.boolean  "recibe_ayuda_de_programas_sociales"
    t.string   "programas_sociales_recibidos"
    t.string   "tipo_de_ayuda_recibida_de_programas_sociales"
    t.boolean  "vinculado_a_sociedad_civil"
    t.text     "tipo_de_participacion_en_sociedad_civil"
    t.boolean  "recibio_ayuda_de_la_sociedad_civil"
    t.text     "justificacion_no_haber_recibido_ayuda_de_sociedad_civil"
    t.text     "capacitaciones_recibidas"
    t.text     "maquinarias_y_herramientas_utilizadas"
    t.boolean  "dispone_de_espacio_fisico"
    t.string   "tipo_de_espacio"
    t.text     "posible_solucion_a_falta_de_espacio"
    t.boolean  "es_en_vivienda_particular"
    t.boolean  "siendo_en_vivienda_particular_el_espacio_es_suficiente"
    t.boolean  "es_necesario_acondicionamiento"
    t.boolean  "ocupa_lugares_destinados_a_otros_usos"
    t.text     "espacio_y_acondicinamiento_requeridos_para_crecer"
    t.text     "caracteristicas_y_zonas_de_clientes_actuales"
    t.integer  "cantidad_de_clientes_actuales"
    t.text     "caracteristicas_y_zonas_de_futuros_clientes"
    t.boolean  "competencia_en_mismo_barrio"
    t.text     "descripcion_de_competencia_en_mismo_barrio"
    t.text     "herramientas_necesarias"
    t.text     "maquinarias_necesarias"
    t.text     "movilidad_necesaria"
    t.text     "insumos_necesarios"
    t.text     "instalaciones_necesarias"
    t.text     "capacitaciones_necesaria"
    t.text     "otras_necesidades"
    t.text     "observaciones"
    t.boolean  "empadronado"
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
    t.integer  "autor_id"
    t.integer  "organizador_id"
    t.string   "folleto_file_name"
    t.string   "folleto_content_type"
    t.integer  "folleto_file_size"
    t.datetime "folleto_updated_at"
    t.boolean  "publicado"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "eventos", ["autor_id"], :name => "index_eventos_on_autor_id"
  add_index "eventos", ["barrio_id"], :name => "index_eventos_on_barrio_id"
  add_index "eventos", ["organizador_id"], :name => "index_eventos_on_organizador_id"

  create_table "instituciones", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "telefono"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "instituciones", ["barrio_id"], :name => "index_instituciones_on_barrio_id"

  create_table "mensajes", :force => true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.boolean  "leido"
    t.integer  "remitente_id"
    t.integer  "destinatario_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "mensajes", ["destinatario_id"], :name => "index_mensajes_on_destinatario_id"
  add_index "mensajes", ["remitente_id"], :name => "index_mensajes_on_remitente_id"

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.text     "resumen"
    t.text     "texto"
    t.integer  "autor_id"
    t.boolean  "publicada"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "noticias", ["autor_id"], :name => "index_noticias_on_autor_id"

  create_table "perfiles", :force => true do |t|
    t.integer  "emprendedor_id"
    t.string   "dni"
    t.string   "cuit_cuil"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.string   "telefono_particular"
    t.string   "telefono_celular"
    t.string   "telefono_para_mensajes"
    t.text     "observaciones_de_telefonos"
    t.string   "nivel_de_estudios"
    t.boolean  "estudios_completos"
    t.string   "titulo"
    t.boolean  "recibe_o_recibio_algun_plan_social"
    t.string   "plan_social"
    t.date     "fecha_de_recepcion"
    t.string   "actividad_laboral_principal"
    t.string   "relacion_laboral"
    t.integer  "cantidad_de_horas_semanales"
    t.boolean  "es_unico_ingreso"
    t.text     "explicacion_de_ingresos"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "perfiles", ["barrio_id"], :name => "index_perfiles_on_barrio_id"
  add_index "perfiles", ["emprendedor_id"], :name => "index_perfiles_on_emprendedor_id"

  create_table "productos", :force => true do |t|
    t.integer  "emprendedor_id"
    t.integer  "rubro_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.string   "tipo_de_venta"
    t.float    "precio"
    t.integer  "produccion_mensual"
    t.integer  "produccion_anual"
    t.integer  "produccion_maxima"
    t.string   "imagen_file_name"
    t.string   "imagen_content_type"
    t.integer  "imagen_file_size"
    t.datetime "imagen_updated_at"
    t.string   "imagen1"
    t.string   "imagen2"
    t.string   "imagen3"
    t.string   "imagen4"
    t.string   "imagen5"
    t.boolean  "activo"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "productos", ["emprendedor_id"], :name => "index_productos_on_emprendedor_id"
  add_index "productos", ["rubro_id"], :name => "index_productos_on_rubro_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rubros", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "servicios", :force => true do |t|
    t.integer  "emprendedor_id"
    t.integer  "rubro_id"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "imagen1"
    t.string   "imagen2"
    t.string   "imagen3"
    t.string   "imagen4"
    t.string   "imagen5"
    t.boolean  "activo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "servicios", ["emprendedor_id"], :name => "index_servicios_on_emprendedor_id"
  add_index "servicios", ["rubro_id"], :name => "index_servicios_on_rubro_id"

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "sexo"
    t.string   "rol"
    t.integer  "institucion_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "locked_at"
  end

  add_index "usuarios", ["confirmation_token"], :name => "index_usuarios_on_confirmation_token", :unique => true
  add_index "usuarios", ["email"], :name => "index_usuarios_on_email", :unique => true
  add_index "usuarios", ["institucion_id"], :name => "index_usuarios_on_institucion_id"
  add_index "usuarios", ["reset_password_token"], :name => "index_usuarios_on_reset_password_token", :unique => true

end
