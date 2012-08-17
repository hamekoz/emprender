# There are several options that you can set here.
# Check https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb for more

require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions

      class Aceptar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.aceptar
            end
            flash[:success] = "#{@model_config.label} aceptado."
            redirect_to back_or_index
          end
        end
      end

      class Rechazar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.rechazar
            end
            flash[:success] = "#{@model_config.label} rechazado."
            redirect_to back_or_index
          end
        end
      end

      class Activar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.activar
            end
            flash[:success] = "#{@model_config.label} activado."
            redirect_to back_or_index
          end
        end
      end

      class Desactivar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.desactivar
            end
            flash[:success] = "#{@model_config.label} desactivado."
            redirect_to back_or_index
          end
        end
      end

      class Publicar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.publicar
            end
            flash[:success] = "#{@model_config.label} Publicado."
            redirect_to back_or_index
          end
        end
      end

      class Despublicar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.despublicar
            end
            flash[:success] = "#{@model_config.label} despublicado."
            redirect_to back_or_index
          end
        end
      end

    end
  end
end
