class CreateTiposEventos < ActiveRecord::Migration
  def self.up
    create_table :tipos_eventos do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_eventos
  end
end
