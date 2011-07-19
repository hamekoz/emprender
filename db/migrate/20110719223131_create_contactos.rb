class CreateContactos < ActiveRecord::Migration
  def self.up
    create_table :contactos do |t|
      t.references :persona
      t.references :domicilio
      t.string :mail

      t.timestamps
    end
  end

  def self.down
    drop_table :contactos
  end
end
