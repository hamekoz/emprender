class CreateTiposTelefonos < ActiveRecord::Migration
  def self.up
    create_table :tipos_telefonos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_telefonos
  end
end
