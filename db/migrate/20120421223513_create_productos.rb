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
      t.boolean     :activo
      t.boolean     :aceptado
      t.has_attached_file :imagen_1
      t.has_attached_file :imagen_2
      t.has_attached_file :imagen_3
      t.has_attached_file :imagen_4
      t.has_attached_file :imagen_5
      t.has_attached_file :imagen_6


      t.timestamps
    end
    add_index :productos, :emprendimiento_id
    add_index :productos, :rubro_id
  end
end
