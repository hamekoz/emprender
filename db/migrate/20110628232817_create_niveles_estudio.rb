class CreateNivelesEstudio < ActiveRecord::Migration
  def self.up
    create_table :niveles_estudio do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :niveles_estudio
  end
end
