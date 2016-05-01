module Archetype
  class Engine < ::Rails::Engine
    isolate_namespace Archetype

    initializer 'archetype.autoload' do
      # Rails.application.eager_load!
      unless Rails.configuration.cache_classes
        ActionDispatch::Reloader.to_cleanup do
          Archetype.reload!
        end
      end
    end

    initializer 'archetype.configure_controllers' do
      Rails.application.config.after_initialize do
        Archetype.controllers.each_value(&:configure)
      end
    end
  end
end
