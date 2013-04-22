class AddDomicilioToEventos < ActiveRecord::Migration
  def change
    add_column :eventos, :domicilio, :string
  end
end
