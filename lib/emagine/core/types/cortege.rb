# frozen_string_literal: true

module Emagine
  module Core
    module Declarations
      class Cortege < Base

        attr_reader :attributes

        def initialize
          @attributes = AttributesManager.new
        end

        def [](idx)
          attributes[idx]
        end

        def specify_child(child)
          super
          child.attributes = attributes.dup
        end

        def inherit
          child = super
          child.attributes = attributes.dup
          child
        end

        protected

        attr_writer :attributes
      end
    end
  end
end
