class CreateBarrios < ActiveRecord::Migration[4.2]
  def change
    create_table :barrios do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
