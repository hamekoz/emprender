class CreateClasificaciones < ActiveRecord::Migration
  def change
    create_table :clasificaciones do |t|
      t.string :nombre
      t.string :descripcion
      t.string :codigo

      t.timestamps
    end
  end
end
