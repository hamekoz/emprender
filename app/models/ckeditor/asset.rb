##
# Representa un archivo de recursos del editor de texto avanzando utilizado
# en la redaccion de las Noticias
class Ckeditor::Asset < ActiveRecord::Base
  attr_accessible :data_file_name,
                  :data_content_type,
                  :data_file_size,
                  :assetable_id,
                  :assetable_type,
                  :type

  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip
end
