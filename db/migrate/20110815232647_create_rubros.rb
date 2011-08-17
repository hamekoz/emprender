class CreateRubros < ActiveRecord::Migration
  def self.up
    create_table :rubros do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :rubros
  end
end
