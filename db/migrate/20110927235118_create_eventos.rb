class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.string :tipo
      t.string :nombre
      t.text :descripcion
      t.references :domicilio
      t.datetime :fecha_y_hora_de_inicio
      t.datetime :fecha_y_hora_de_finalizacion
      t.references :institucion
      t.boolean :publicado
      t.datetime :fecha_de_publicacion

      t.timestamps
    end
    add_index :eventos, :domicilio_id
    add_index :eventos, :institucion_id
  end
end
