class CreateNoticias < ActiveRecord::Migration
  def self.up
    create_table :noticias do |t|
      t.string :titulo
      t.string :autor
      t.text :texto
      t.datetime :fecha_publicacion
      t.boolean :publicada
      t.string :titulo
      t.datetime :fecha
      t.string :texto
      t.boolean :publicado

      t.timestamps
    end
  end

  def self.down
    drop_table :noticias
  end
end
