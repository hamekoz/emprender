class CreateDomicilios < ActiveRecord::Migration
  def change
    create_table :domicilios do |t|
      t.string :calle
      t.integer :numero
      t.integer :piso
      t.string :departamento
      t.string :observacion
      t.references :barrio

      t.timestamps
    end
  end
end
