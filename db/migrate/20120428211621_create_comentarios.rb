class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.text        :texto
      t.references  :usuario
      t.boolean     :leido
      t.boolean     :publico
      t.references  :comentable, :polymorphic => true

      t.timestamps
    end
    add_index :comentarios, :usuario_id
  end
end
