class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.references :rubro
	  t.string :nombre
      t.string :descripcion
      t.string :imagen1
      t.string :imagen2
      t.string :imagen3
      t.string :imagen4
      t.string :imagen5
	  t.boolean :activo

      t.timestamps
    end
  end
end
