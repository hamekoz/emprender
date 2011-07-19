class CreateEventosInstituciones < ActiveRecord::Migration
  def self.up
    create_table :eventos_instuciones, :id => false do |t|
      t.references :evento
      t.references :institucion
    end
  end

  def self.down
    drop_table :eventos_instuciones
  end
end
