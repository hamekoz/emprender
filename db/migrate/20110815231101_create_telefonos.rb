class CreateTelefonos < ActiveRecord::Migration
  def self.up
    create_table :telefonos do |t|
      t.string :fijo
      t.string :celular
      t.string :mensajes
      t.string :observaciones

      t.timestamps
    end
  end

  def self.down
    drop_table :telefonos
  end
end
