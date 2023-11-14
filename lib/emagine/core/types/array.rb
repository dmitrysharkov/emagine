module Emagine
  module Core
    module Types
      class Array < Base
        attr_reader :element_type

        def initialize(element_type)
          @element_type = element_type
        end
      end
    end
  end
end
