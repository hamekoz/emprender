class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.references  :emprendedor
      t.references  :rubro
      t.string      :nombre
      t.string      :descripcion
      t.float       :precio
      t.string      :imagen1
      t.string      :imagen2
      t.string      :imagen3
      t.string      :imagen4
      t.string      :imagen5
      t.boolean     :activo

      t.timestamps
    end
    add_index :productos, :emprendedor_id
    add_index :productos, :rubro_id
  end
end
