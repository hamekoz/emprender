class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
	  t.column "nombre", :string
	  t.column "descripcion", :string
	  t.column "imagen1", :string
      t.timestamps
    end
  end
end
