class CreateNoticias < ActiveRecord::Migration
  def self.up
    create_table :noticias do |t|
      t.string :titulo
      t.text :texto
      t.string :autor
      t.datetime :fecha
      t.boolean :publicada

      t.timestamps
    end
  end

  def self.down
    drop_table :noticias
  end
end
