class AddVisibleToInstituciones < ActiveRecord::Migration[4.2]
  def change
    add_column :instituciones, :visible, :boolean
  end
end
