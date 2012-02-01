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

ActiveRecord::Schema.define(:version => 20120131235159) do

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
    t.string   "celular"
    t.string   "domicilio"
    t.integer  "barrio_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
