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

ActiveRecord::Schema.define(:version => 20110927235118) do

  create_table "barrios", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clasificaciones", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "codigo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contactos", :force => true do |t|
    t.integer  "persona_id"
    t.integer  "telefono_id"
    t.integer  "domicilio_id"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documentos", :force => true do |t|
    t.string   "nombre"
    t.string   "abreviatura"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domicilios", :force => true do |t|
    t.string   "calle"
    t.integer  "numero"
    t.integer  "piso"
    t.string   "departamento"
    t.string   "observacion"
    t.integer  "barrio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estudios", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eventos", :force => true do |t|
    t.integer  "tipoEvento_id"
    t.string   "nombre"
    t.text     "descripcion"
    t.integer  "domicilio_id"
    t.datetime "fechaHoraInicio"
    t.datetime "fechaHoraFinalizacion"
    t.integer  "institucion_id"
    t.boolean  "publicado"
    t.datetime "fechaPublicacion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "eventos", ["domicilio_id"], :name => "index_eventos_on_domicilio_id"
  add_index "eventos", ["institucion_id"], :name => "index_eventos_on_institucion_id"
  add_index "eventos", ["tipoEvento_id"], :name => "index_eventos_on_tipoEvento_id"

  create_table "instituciones", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.integer  "telefono_id"
    t.integer  "domicilio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.string   "autor"
    t.datetime "fecha"
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

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "telefonos", :force => true do |t|
    t.string   "fijo"
    t.string   "celular"
    t.string   "mensajes"
    t.string   "observaciones"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipos_eventos", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "usuario"
    t.string   "password_cifrada"
    t.string   "mail"
    t.integer  "rol_id"
    t.integer  "persona_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
