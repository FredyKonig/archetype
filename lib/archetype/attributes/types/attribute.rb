module Archetype
  module Attributes
    module Types
      class Attribute
        attr_accessor :name, :type, :contexts, :options

        def initialize(name, type, options={})
          @name = name.to_sym
          @type = type.to_sym
          @contexts = options.delete(:contexts){ [] }
          @options = options || {}
        end

        def column
          options[:column]
        end

        alias_method :param, :name

        def from(object)
          object.send(name)
        end

        def update(params)
          params.each{|k,v| send("#{k}=", v) if respond_to?("#{k}=") }
          %i(type column).each{|k| send("#{k}=", value = params.delete(k)) if value }
          self.contexts = filter_contexts(contexts.dup, params.delete(:context))
          self.options = params
        end

        def presenter_class
          return options[:presenter_class] if options.key?(:presenter_class)
          type_presenter || default_presenter
        end

        private

        def type_presenter
          Presenters.const_get "#{type.to_s.classify}Presenter"
        rescue NameError
        end

        def default_presenter
          Presenters::AttributePresenter
        end
      end
    end
  end
end
