require 'archetype/interface'

module Archetype
  module Base
    extend ActiveSupport::Concern

    included do
      extend BaseHelpers
      include Archetype::Interface

      Archetype.register(self)
      delegate :archetype_name, to: :class
      helper_method :archetype_user
      before_filter :authenticate_archetype!
    end

    def archetype_user
      send(Archetype.application.config.user_method)
    end

    private

    def authenticate_archetype!
      send(Archetype.application.config.authenticate_method)
    end
    
    module BaseHelpers
      def archetype_name
        controller_name.to_sym
      end

      def archetype_controller
        Archetype.controllers[archetype_name]
      end

      def local_prefixes
        super.push('archetype/base')
      end
  
      # TODO: untested, probably works..
      def inherited?(base)
        super
        Archetype.register(base)
      end
    end

  end
end
