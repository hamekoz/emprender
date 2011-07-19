class CreateInstitucionesUsuarios < ActiveRecord::Migration
  def self.up
    create_table :instituciones_usuarios, :id => false do |t|
      t.references :institucion
      t.references :usuario
    end
  end

  def self.down
    drop_table :instituciones_usuarios
  end
end
