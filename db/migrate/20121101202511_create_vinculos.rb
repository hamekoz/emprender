class CreateVinculos < ActiveRecord::Migration[4.2]
  def change
    create_table :vinculos do |t|
      t.string :nombre
      t.string :url

      t.timestamps
    end
  end
end
