class CreateEmprendedores < ActiveRecord::Migration
  def self.up
    create_table :emprendedores do |t|
      t.integer :persona_id

      t.timestamps
    end
  end

  def self.down
    drop_table :emprendedores
  end
end
