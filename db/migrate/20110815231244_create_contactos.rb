class CreateContactos < ActiveRecord::Migration
  def change
    create_table :contactos do |t|
      t.references :persona
      t.string :mail
      t.string :telefono
	  t.string :telefono_mensajes
	  t.string :comentarios
      t.string :celular
      t.string :domicilio
      t.references :barrio

      t.timestamps
    end
  end
end
