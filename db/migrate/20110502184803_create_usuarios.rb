class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :usuario
      t.string :password_cifrada
      t.integer :rol_id

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
