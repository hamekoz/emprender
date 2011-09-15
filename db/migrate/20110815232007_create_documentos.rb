class CreateDocumentos < ActiveRecord::Migration
  def change
    create_table :documentos do |t|
      t.string :nombre
      t.string :abreviatura

      t.timestamps
    end
  end
end
