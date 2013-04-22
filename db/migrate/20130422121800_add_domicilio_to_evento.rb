class AddDomiciloToEventos < ActiveRecord::Migration
  def self.up
    add_column :eventos, :domicilio, :string
  end

  def self.down
    remove_column :eventos, :domicilio
  end
end
