class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.string :nombre
      t.references :tipoEvento
      t.references :domicilio
      t.text :descripcion
      t.datetime :fecha_hora_de_inicio
      t.datetime :fecha_hora_de_finalizacion
      t.references :institucion
      t.boolean :publicado
      t.datetime :fecha_de_publicacion

      t.timestamps
    end
  end

  def self.down
    drop_table :eventos
  end
end