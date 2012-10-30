class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string      :asunto
      t.text        :texto
      t.boolean     :leido, :default => false
      t.references  :remitente
      t.references  :destinatario
      t.boolean     :eliminado_remitente, :default => false
      t.boolean     :eliminado_destinatario, :default => false

      t.timestamps
    end
    add_index :mensajes, :remitente_id
    add_index :mensajes, :destinatario_id
  end
end
