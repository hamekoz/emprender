class AddVisibleToInstituciones < ActiveRecord::Migration
  def change
    add_column :instituciones, :visible, :boolean
  end
end
