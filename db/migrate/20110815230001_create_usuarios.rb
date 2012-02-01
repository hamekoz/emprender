class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.references :persona
      t.string :rol

      t.timestamps
    end
  end
end
