class CreateActividades < ActiveRecord::Migration
  def change
    create_table :actividades do |t|

      t.timestamps
    end
  end
end
