class AddSesionesTable < ActiveRecord::Migration
  def self.up
    create_table :sesiones do |t|
      t.string :sesion_id, :null => false
      t.text :data
      t.timestamps
    end

    add_index :sesiones, :sesion_id
    add_index :sesiones, :updated_at
  end

  def self.down
    drop_table :sesiones
  end
end
