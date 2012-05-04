class CreateInstituciones < ActiveRecord::Migration
  def change
    create_table :instituciones do |t|
      t.string      :nombre
      t.string      :descripcion
      t.string      :telefono
      t.string      :domicilio
      t.references  :barrio

      t.timestamps
    end
    add_index :instituciones, :barrio_id
  end
end
