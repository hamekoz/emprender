class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
<<<<<<< HEAD
      t.string :nombre
      t.references :tipoEvento
      t.references :domicilio
      t.text :descripcion
      t.datetime :fecha_hora_de_inicio
      t.datetime :fecha_hora_de_finalizacion
      t.references :institucion
      t.boolean :publicado
      t.datetime :fecha_de_publicacion
=======
      t.string, :titulo
      t.datatime, :fechaDeInicio
      t.datetime, :fechaDeFinalizacion
      t.texto, :lugar
      t.string, :descripcion
      t.boolean :publicado
>>>>>>> a0af26a1e0cf69aa87835ce059b8d63e7b4e1ee0

      t.timestamps
    end
  end

  def self.down
    drop_table :eventos
  end
end
