class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.references :persona
      t.references :telefono
      t.references :domicilio
      t.string :mail

      t.timestamps
    end
  end
end
