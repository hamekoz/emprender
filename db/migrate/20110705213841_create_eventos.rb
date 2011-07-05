class CreateEventos < ActiveRecord::Migration
  def self.up
    create_table :eventos do |t|
      t.string, :titulo
      t.datatime, :fechaDeInicio
      t.datetime, :fechaDeFinalizacion
      t.texto, :lugar
      t.string, :descripcion
      t.boolean :publicado

      t.timestamps
    end
  end

  def self.down
    drop_table :eventos
  end
end
