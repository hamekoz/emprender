class CreateInstituciones < ActiveRecord::Migration
  def self.up
    create_table :instituciones do |t|
      t.string :nombre
      t.text :descripcion
      t.references :domicilio

      t.timestamps
    end
  end

  def self.down
    drop_table :instituciones
  end
end
