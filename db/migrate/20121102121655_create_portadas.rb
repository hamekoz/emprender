class CreatePortadas < ActiveRecord::Migration
  def change
    create_table :portadas do |t|
      t.string :titulo
      t.text :texto
      t.has_attached_file :foto
      t.boolean :visible

      t.timestamps
    end
  end
end
