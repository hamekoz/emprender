class CreateInstituciones < ActiveRecord::Migration
  def change
    create_table :instituciones do |t|
      t.string :nombre
      t.string :descripcion
      t.references :telefono
      t.references :domicilio

      t.timestamps
    end
  end
end
