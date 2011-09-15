class CreateTelefonos < ActiveRecord::Migration
  def change
    create_table :telefonos do |t|
      t.string :fijo
      t.string :celular
      t.string :mensajes
      t.string :observaciones

      t.timestamps
    end
  end
end
