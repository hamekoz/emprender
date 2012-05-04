class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string      :titulo
      t.text        :texto
      t.boolean     :leido
      t.references  :remitente
      t.references  :destinatario

      t.timestamps
    end
    add_index :mensajes, :remitente_id
    add_index :mensajes, :destinatario_id
  end
end
