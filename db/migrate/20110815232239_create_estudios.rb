class CreateEstudios < ActiveRecord::Migration
  def self.up
    create_table :estudios do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :estudios
  end
end
