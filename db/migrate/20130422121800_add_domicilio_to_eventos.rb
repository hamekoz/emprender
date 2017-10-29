class AddDomicilioToEventos < ActiveRecord::Migration[4.2]
  def change
    add_column :eventos, :domicilio, :string
  end
end
