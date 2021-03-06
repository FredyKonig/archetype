module Archetype
  class ArrayBuilder
    include Builder
    extend Forwardable
    def_delegators :@array, :<<, :+, :length, :any?, :collect, :find

    def initialize(array=[])
      @array = array
    end

    def initialize_clone(other)
      @array = other.instance_variable_get(:@array).clone
      super
    end

    def build(delegate)
      return [] unless any?
      collect do |object|
        object = object.build(delegate) if object.respond_to?(:build)
        object
      end
    end

    def to_a
      @array
    end
  end
end
