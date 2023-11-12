module Emagine
  module Runtime
    module Instances
      class Base
        attr_reader :declaration, :raw_data

        def initialize(declaration, **raw_data)
          @declaration = declaration
          @raw_data = raw_data
        end
      end
    end
  end
end
