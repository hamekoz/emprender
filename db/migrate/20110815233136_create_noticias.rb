class CreateNoticias < ActiveRecord::Migration
  def change
    create_table :noticias do |t|
      t.string      :titulo
      t.text        :texto
      t.references  :autor
      t.datetime    :fecha
      t.boolean     :publicada

      t.timestamps
    end
    add_index :noticias, :autor_id
  end
end
