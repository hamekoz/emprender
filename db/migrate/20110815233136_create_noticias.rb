class CreateNoticias < ActiveRecord::Migration
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.text :texto
      t.string :autor
      t.datetime :fecha
      t.boolean :publicada

      t.timestamps
    end
  end
end
