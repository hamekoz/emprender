class AddContactoToInstituciones < ActiveRecord::Migration
  def change
    add_column :instituciones, :web, :string, after: :descripcion
    add_column :instituciones, :mail, :string, after: :web
  end
end
