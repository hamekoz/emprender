class CreateInstituciones < ActiveRecord::Migration
  def self.up
    create_table :instituciones do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :instituciones
  end
end
