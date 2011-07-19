class CreateEmprendedoresTelefonos < ActiveRecord::Migration
  def self.up
    create_table :emprendedores_telefonos, :id => false do |t|
      t.references :emprededor
      t.references :telefono
    end
  end

  def self.down
    drop_table :emprendedores_telefonos
  end
end
