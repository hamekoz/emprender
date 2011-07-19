class CreateDomicilios < ActiveRecord::Migration
  def self.up
    create_table :domicilios do |t|
      t.string :calle
      t.integer :numero
      t.integer :piso
      t.string :departamento
      t.string :entreCalles
      t.integer :barrio_id

      t.timestamps
    end
  end

  def self.down
    drop_table :domicilios
  end
end
