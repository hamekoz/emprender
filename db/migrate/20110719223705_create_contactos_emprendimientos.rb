class CreateContactosEmprendimientos < ActiveRecord::Migration
  def self.up
    create_table :contactos_emprendimientos, :id => false do |t|
      t.references :emprendimiento
      t.references :contacto
    end
  end

  def self.down
    drop_table :contactos_emprendimientos
  end
end
