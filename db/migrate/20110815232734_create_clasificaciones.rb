class CreateClasificaciones < ActiveRecord::Migration[4.2]
  def change
    create_table :clasificaciones do |t|
      t.string :codigo
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
