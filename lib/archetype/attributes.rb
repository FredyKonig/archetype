require 'archetype/attributes/attribute_set'
require 'archetype/attributes/attribute'
require 'archetype/attributes/association'
require 'archetype/attributes/attribute_presenter'
require 'archetype/attributes/association_presenter'
require 'archetype/attributes/simple_form/input'
require 'archetype/attributes/simple_form/association'
require 'archetype/attributes/configuration'
require 'archetype/attributes/presenter'

module Archetype
  module Attributes
    extend ActiveSupport::Concern

    #TODO: perfect example of duplicated module config
    class << self
      def config_for(controller)
        Configuration.new(controller)
      end
    end

    included do
      helper_method :attributes
      archetype.module(:attributes, Attributes)
    end

    def attributes
      @attributes ||= Presenter.new(self)
    end

    module ClassMethods
      def local_prefixes
        super.push('archetype/resource')
      end
    end
  end
end
