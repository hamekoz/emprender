class CreateRubros < ActiveRecord::Migration[4.2]
  def change
    create_table :rubros do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
