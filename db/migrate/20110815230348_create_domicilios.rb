class CreateDomicilios < ActiveRecord::Migration
  def self.up
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

  def self.down
    drop_table :domicilios
  end
end