class CreateClasificaciones < ActiveRecord::Migration
  def change
    create_table :clasificaciones do |t|
      t.string :codigo
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
