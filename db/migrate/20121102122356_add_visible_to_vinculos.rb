class AddVisibleToVinculos < ActiveRecord::Migration
  def change
    add_column :vinculos, :visible, :boolean
  end
end
