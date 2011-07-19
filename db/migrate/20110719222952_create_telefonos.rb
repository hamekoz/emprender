class CreateTelefonos < ActiveRecord::Migration
  def self.up
    create_table :telefonos do |t|
      t.string :numero
      t.references :tipo_telefono

      t.timestamps
    end
  end

  def self.down
    drop_table :telefonos
  end
end
