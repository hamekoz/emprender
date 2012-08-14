class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.references  :emprendimiento
      t.references  :rubro
      t.string      :nombre
      t.text        :descripcion
      t.string      :tipo_de_venta
      t.float       :precio
      t.integer     :produccion_mensual
      t.integer     :produccion_anual
      t.integer     :produccion_maxima
      t.has_attached_file :imagen1
      t.has_attached_file :imagen2
      t.has_attached_file :imagen3
      t.has_attached_file :imagen4
      t.has_attached_file :imagen5
      t.has_attached_file :imagen6
      t.boolean     :activo
	  t.boolean     :moderado

      t.timestamps
    end
    add_index :productos, :emprendimiento_id
    add_index :productos, :rubro_id
  end
end
