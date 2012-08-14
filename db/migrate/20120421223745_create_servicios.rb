class CreateServicios < ActiveRecord::Migration
  def change
    create_table :servicios do |t|
      t.references  :emprendimiento
      t.references  :rubro
      t.string      :nombre
      t.string      :descripcion
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
    add_index :servicios, :emprendimiento_id
    add_index :servicios, :rubro_id
  end
end
