class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string      :nombre
      t.string      :apellido
      t.string      :sexo
      t.string      :rol
      t.references  :institucion

      t.timestamps
    end
    add_index :usuarios, :institucion_id
  end
end
