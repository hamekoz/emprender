class AddAceptadoToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :aceptado, :boolean, :default => false, :null => false
    add_index  :usuarios, :aceptado
  end

  def self.down
    remove_index  :usuarios, :aceptado
    remove_column :usuarios, :aceptado
  end
end
