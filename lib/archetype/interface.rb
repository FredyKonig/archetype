require 'archetype/interface/navigable'
require 'archetype/interface/navigation'
require 'archetype/interface/dsl'
require 'archetype/interface/instance'

module Archetype
  module Interface
    extend ActiveSupport::Concern

    included do
      extend DSL

      layout 'archetype/application'
      helper_method :interface, :page
    end

    def interface
      Instance.new(self)
    end

    module ClassMethods
    end

  end
end
