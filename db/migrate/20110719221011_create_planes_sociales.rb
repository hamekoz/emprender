class CreatePlanesSociales < ActiveRecord::Migration
  def self.up
    create_table :planes_sociales do |t|
      t.string :nombre
      t.text :descripcion
      t.references :institucion

      t.timestamps
    end
  end

  def self.down
    drop_table :planes_sociales
  end
end
