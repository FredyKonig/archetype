require "wysiwyg-rails"
require "font-awesome-rails"
require 'archetype/attributes/presenter'
require 'archetype/attributes/fieldset'
require 'archetype/attributes/attribute_set'
require 'archetype/attributes/attribute'
require 'archetype/attributes/association'
require 'archetype/attributes/nested_attributes'
require 'archetype/attributes/types/has_one'
require 'archetype/attributes/types/has_many'
require 'archetype/attributes/types/uploader'
require 'archetype/attributes/model_factory'
require 'archetype/attributes/fieldset_builder'
require 'archetype/attributes/attribute_builder'
require 'archetype/attributes/association_builder'
require 'archetype/attributes/nested_builder'
require 'archetype/attributes/text_builder'
require 'archetype/attributes/presenters/fieldset_presenter'
require 'archetype/attributes/presenters/attribute_presenter'
require 'archetype/attributes/presenters/association_presenter'
require 'archetype/attributes/presenters/has_one_presenter'
require 'archetype/attributes/presenters/has_many_presenter'
require 'archetype/attributes/presenters/boolean_presenter'
require 'archetype/attributes/presenters/datetime_presenter'
require 'archetype/attributes/presenters/text_presenter'
require 'archetype/attributes/presenters/time_presenter'
require 'archetype/attributes/presenters/uploader_presenter'
require 'archetype/attributes/simple_form/input'
require 'archetype/attributes/simple_form/association'
require 'archetype/attributes/simple_form/has_one'
require 'archetype/attributes/simple_form/datetime'
require 'archetype/attributes/simple_form/nested'
require 'archetype/attributes/simple_form/time'
require 'archetype/attributes/simple_form/uploader'
require 'archetype/attributes/configuration'
require 'archetype/attributes/controller'
require 'archetype/attributes/builder'

module Archetype
  module Attributes
    extend ActiveSupport::Concern

    included do
      helper_method :attributes
      archetype.module Attributes::Controller
    end

    def attributes
      @attributes ||= Presenter.new(archetype_controller.attributes, self)
    end

    module ClassMethods
      def local_prefixes
        super.push('archetype/resource')
      end
    end
  end
end
