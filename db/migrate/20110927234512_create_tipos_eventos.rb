class CreateTiposEventos < ActiveRecord::Migration
  def change
    create_table :tipos_eventos do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
