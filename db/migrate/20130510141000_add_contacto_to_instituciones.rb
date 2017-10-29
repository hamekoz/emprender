class AddContactoToInstituciones < ActiveRecord::Migration[4.2]
  def change
    add_column :instituciones, :web, :string, after: :descripcion
    add_column :instituciones, :mail, :string, after: :web
  end
end
