class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :tipoEvento
      t.string :nombre
      t.text :descripcion
      t.references :domicilio
      t.datetime :fechaHoraInicio
      t.datetime :fechaHoraFinalizacion
      t.references :institucion
      t.boolean :publicado
      t.datetime :fechaPublicacion

      t.timestamps
    end
    add_index :eventos, :tipoEvento_id
    add_index :eventos, :domicilio_id
    add_index :eventos, :institucion_id
  end
end
