class CreateEmprendimientos < ActiveRecord::Migration
  def change
    create_table :emprendimientos do |t|
      t.string :nombre
      t.boolean :marca_registrada
      t.string :marca
      t.references :clasificacion
      t.references :estado
      t.references :contacto
      t.date :fecha_de_inicio
      t.text :descripcion
      t.integer :cantidad_de_integrantes
      t.string :mail
      t.string :web
      t.string :domicilio

      t.timestamps
    end
    add_index :emprendimientos, :clasificacion_id
    add_index :emprendimientos, :estado_id
  end
end
