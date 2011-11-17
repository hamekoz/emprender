class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :password_digest
      t.string :mail
      t.references :rol
      t.references :persona

      t.timestamps
    end
  end
end
