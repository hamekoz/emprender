class CreateTiposDocumentos < ActiveRecord::Migration
  def self.up
    create_table :tipos_documentos do |t|
      t.string :abreviatura
      t.text :descripcion

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_documentos
  end
end
