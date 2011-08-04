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

ActiveRecord::Schema.define(:version => 20110719223810) do

  create_table "barrios", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contactos", :force => true do |t|
    t.integer  "persona_id"
    t.integer  "domicilio_id"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contactos_emprendimientos", :id => false, :force => true do |t|
    t.integer "emprendimiento_id"
    t.integer "contacto_id"
  end

  create_table "contactos_telefonos", :id => false, :force => true do |t|
    t.integer "contacto_id"
    t.integer "telefono_id"
  end

  create_table "domicilios", :force => true do |t|
    t.string   "calle"
    t.integer  "numero"
    t.integer  "piso"
    t.string   "departamento"
    t.string   "entreCalles"
    t.integer  "barrio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emprendedores", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "tipoDocumento_id"
    t.string   "nro_documento"
    t.integer  "domicilio_id"
    t.integer  "nivelEstudio_id"
    t.boolean  "estudio_completo"
    t.integer  "hijos"
    t.integer  "planSocial_id"
    t.datetime "fecha_desde_plan_social"
    t.datetime "fecha_hasta_plan_social"
    t.boolean  "actividad_labotal_adicional"
    t.boolean  "actividad_labotal_adicional_independiente"
    t.boolean  "actividad_labotal_adicional_relacionada_al_emprendimiento"
    t.integer  "actividad_labotal_adicional_horas_semanales"
    t.boolean  "actividad_labotal_adicional_unico_ingreso"
    t.integer  "emprendimiento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emprendedores_telefonos", :id => false, :force => true do |t|
    t.integer "emprededor_id"
    t.integer "telefono_id"
  end

  create_table "emprendimientos_telefonos", :id => false, :force => true do |t|
    t.integer "emprendimiento_id"
    t.integer "telefono_id"
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventos", :force => true do |t|
    t.string   "nombre"
    t.integer  "tipoEvento_id"
    t.integer  "domicilio_id"
    t.text     "descripcion",                :limit => 255
    t.datetime "fecha_hora_de_inicio"
    t.datetime "fecha_hora_de_finalizacion"
    t.integer  "institucion_id"
    t.boolean  "publicado"
    t.datetime "fecha_de_publicacion"
    t.string   "titulo"
    t.datetime "fechaDeInicio"
    t.datetime "fechaDeFinalizacion"
    t.text     "lugar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventos_instuciones", :id => false, :force => true do |t|
    t.integer "evento_id"
    t.integer "institucion_id"
  end

  create_table "instituciones", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "domicilio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instituciones_usuarios", :id => false, :force => true do |t|
    t.integer "institucion_id"
    t.integer "usuario_id"
  end

  create_table "niveles_estudio", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.string   "autor"
    t.text     "texto",             :limit => 255
    t.datetime "fecha_publicacion"
    t.boolean  "publicada"
    t.datetime "fecha"
    t.boolean  "publicado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personas", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.boolean  "sexo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planes_sociales", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "institucion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubros", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sesiones", :force => true do |t|
    t.string   "sesion_id",  :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sesiones", ["sesion_id"], :name => "index_sesiones_on_sesion_id"
  add_index "sesiones", ["updated_at"], :name => "index_sesiones_on_updated_at"

  create_table "telefonos", :force => true do |t|
    t.string   "numero"
    t.integer  "tipo_telefono_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_documentos", :force => true do |t|
    t.string   "abreviatura"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_eventos", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_telefonos", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.integer  "persona_id"
    t.integer  "rol_id"
    t.string   "usuario"
    t.string   "password_cifrada"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
