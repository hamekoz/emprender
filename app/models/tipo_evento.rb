class TipoEvento < ActiveRecord::Base
  validates :nombre,      :presence => true
  validates :descripcion, :presence => true
end
