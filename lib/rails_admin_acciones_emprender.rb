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
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} aceptados"
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
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} rechazado"
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
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} activado"
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
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} desactivados"
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
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} publicados"
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
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} despublicados"
            redirect_to back_or_index
          end
        end
      end

      class Bloquear < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.bloquear
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} bloqueados"
            redirect_to back_or_index
          end
        end
      end

      class Desbloquear < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :destroy)
            @objects.each do |object|
              object.desbloquear
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} desbloqueados"
            redirect_to back_or_index
          end
        end
      end

    end
  end
end
