# frozen_string_literal: true

module Emagine
  module Core
    module Declarations
      class Attribute < Base
        attr_reader :name, :type, :ordered, :default

        def initialize(name, type, ordered: false, default:  nil)
          @name = name.to_sym
          @type = type
          @default_value = default_value
        end

        alias ordered? ordered
      end
    end
  end
end
