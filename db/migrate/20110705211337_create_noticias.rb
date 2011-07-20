class CreateNoticias < ActiveRecord::Migration
  def self.up
    create_table :noticias do |t|
<<<<<<< HEAD
      t.string :titulo
      t.string :autor
      t.text :texto
      t.datetime :fecha_publicacion
      t.boolean :publicada
=======
      t.string, :titulo
      t.datatime, :fecha
      t.string, :texto
      t.boolean :publicado
>>>>>>> a0af26a1e0cf69aa87835ce059b8d63e7b4e1ee0

      t.timestamps
    end
  end

  def self.down
    drop_table :noticias
  end
end
