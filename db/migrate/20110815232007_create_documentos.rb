class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.string :nombre
      t.string :abreviatura

      t.timestamps
    end
  end

  def self.down
    drop_table :documentos
  end
end
