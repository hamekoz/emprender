class CreateComentarios < ActiveRecord::Migration[4.2]
  def change
    create_table :comentarios do |t|
      t.text        :texto
      t.references  :comentable, :polymorphic => true
      t.boolean     :aceptado

      t.timestamps
    end
  end
end
