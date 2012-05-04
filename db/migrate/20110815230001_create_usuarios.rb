class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.references  :persona
      t.references  :institucion
      t.string      :rol

      t.timestamps
    end
    add_index :usuarios, :persona_id
    add_index :usuarios, :institucion_id
  end
end
