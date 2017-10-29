class CreateInstituciones < ActiveRecord::Migration[4.2]
  def change
    create_table :instituciones do |t|
      t.string      :nombre
      t.text        :descripcion
      t.string      :telefono
      t.string      :domicilio
      t.references  :barrio

      t.timestamps
    end
    add_index :instituciones, :barrio_id
  end
end
