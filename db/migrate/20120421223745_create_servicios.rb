class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.references  :emprendimiento
      t.references  :rubro
      t.string      :nombre
      t.string      :descripcion
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
    add_index :servicios, :emprendimiento_id
    add_index :servicios, :rubro_id
  end
end
