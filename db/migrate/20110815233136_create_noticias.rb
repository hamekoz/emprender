class CreateNoticias < ActiveRecord::Migration[4.2]
  def change
    create_table :noticias do |t|
      t.string      :titulo
      t.text        :resumen
      t.text        :texto
      t.references  :autor
      t.boolean     :publicada

      t.timestamps
    end
    add_index :noticias, :autor_id
  end
end
