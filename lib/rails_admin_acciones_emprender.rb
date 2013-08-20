# There are several options that you can set here.
# Check https://github.com/sferik/rails_admin/blob/master/lib/rails_admin/config/actions/base.rb for more

require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

##
# Modulo del Panel de Administracion
module RailsAdmin
  ##
  # Modulo de Configuracion del Panel de Administracion
  module Config
    ##
    # Modulo de Acciones sobre varios elementos del Panel de Administracion
    module Actions

      ##
      # Accion Aceptar para marcar varios elementos como aceptados
      class Aceptar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.aceptar
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} aceptados"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Rechazar para marcar varios elementos como rechazados
      class Rechazar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.rechazar
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} rechazado"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Activar para marcar varios elementos como activados
      class Activar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.activar
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} activado"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Desactivar para marcar varios elementos como desactivados
      class Desactivar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.desactivar
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} desactivados"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Publicar para marcar varios elementos como publicados
      class Publicar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.publicar
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} publicados"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Despublicar para marcar varios elementos como despublicados
      class Despublicar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.despublicar
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} despublicados"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Desbloquear para desbloquear Usuarios
      class Desbloquear < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.desbloquear
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} desbloqueados"
            redirect_to back_or_index
          end
        end
      end

      ##
      # Accion Apadrinar para establacer la Institucion de varios Emprendedores
      class Apadrinar < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
        register_instance_option :bulkable? do
          true
        end
        register_instance_option :controller do
          Proc.new do
            @objects = list_entries(@model_config, :edit)
            @objects.each do |object|
              object.apadrinar(current_usuario.institucion)
            end
            flash[:success] = "#{@objects.count} #{@model_config.label_plural} apadrinados"
            redirect_to back_or_index
          end
        end
      end

    end
  end
end
