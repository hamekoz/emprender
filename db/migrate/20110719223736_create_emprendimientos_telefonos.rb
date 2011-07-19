class CreateEmprendimientosTelefonos < ActiveRecord::Migration
  def self.up
    create_table :emprendimientos_telefonos, :id => false do |t|
      t.references :emprendimiento
      t.references :telefono
    end
  end

  def self.down
    drop_table :emprendimientos_telefonos
  end
end
