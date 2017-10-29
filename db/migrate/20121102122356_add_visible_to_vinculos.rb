class AddVisibleToVinculos < ActiveRecord::Migration[4.2]
  def change
    add_column :vinculos, :visible, :boolean
  end
end
