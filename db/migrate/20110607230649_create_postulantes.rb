class CreatePostulantes < ActiveRecord::Migration
  def self.up
    create_table :postulantes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :postulantes
  end
end
