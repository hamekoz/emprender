class CreateInformaciones < ActiveRecord::Migration[4.2]
  def change
    create_table :informaciones do |t|
      t.string :titulo
      t.string :subtitulo
      t.text :texto
      t.integer :orden
      t.boolean :visible

      t.timestamps
    end
  end
end
