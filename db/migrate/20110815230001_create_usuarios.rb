class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.references :persona

      t.column :type, :string

      t.timestamps
    end
  end
end
