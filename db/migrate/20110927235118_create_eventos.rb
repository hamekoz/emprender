class CreateEventos < ActiveRecord::Migration[4.2]
  def change
    create_table :eventos do |t|
      t.string      :tipo
      t.string      :nombre
      t.text        :descripcion
      t.string      :lugar
      t.references  :barrio
      t.datetime    :fecha_y_hora_de_inicio
      t.datetime    :fecha_y_hora_de_finalizacion
      t.references  :autor
      t.references  :organizador
      t.has_attached_file :folleto
      t.boolean     :publicado

      t.timestamps
    end
    add_index :eventos, :barrio_id
    add_index :eventos, :autor_id
    add_index :eventos, :organizador_id
  end
end
