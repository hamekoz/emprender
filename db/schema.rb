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

ActiveRecord::Schema.define(:version => 20110713003927) do

  create_table "barrios", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "tipo_documento"
    t.string   "nro_documento"
    t.integer  "domicilio_id"
    t.integer  "nivel_estudio_id"
    t.boolean  "estudio_completo"
    t.integer  "hijos"
    t.integer  "plan_social"
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

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventos", :force => true do |t|
    t.string   "nombre"
    t.integer  "tipoEvento_id"
    t.integer  "domicilio_id"
    t.string   "descripcion"
    t.datetime "fechaHoraDeInicio"
    t.datetime "fechaHoraDeFinalizacion"
    t.integer  "institucion_id"
    t.boolean  "publicado"
    t.datetime "fechaDePublicacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instituciones", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "domicilio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "niveles_estudio", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.string   "autor"
    t.string   "texto"
    t.datetime "fecha_publicacion"
    t.boolean  "publicada"
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

  create_table "roles", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rubros", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
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

  create_table "tipos_eventos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
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
