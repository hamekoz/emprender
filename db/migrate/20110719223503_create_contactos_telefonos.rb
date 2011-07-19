class CreateContactosTelefonos < ActiveRecord::Migration
  def self.up
    create_table :contactos_telefonos, :id => false do |t|
      t.references :contacto
      t.references :telefono
    end
  end

  def self.down
    drop_table :contactos_telefonos
  end
end
