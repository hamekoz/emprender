class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.references :persona
      t.references :rol
      t.string :usuario
      t.string :password_cifrada
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
