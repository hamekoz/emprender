class CreateBarrios < ActiveRecord::Migration
  def change
    create_table :barrios do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
