class CreateEstados < ActiveRecord::Migration[4.2]
  def change
    create_table :estados do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
