class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :rol
      t.references :persona

      t.timestamps
    end
  end
end
