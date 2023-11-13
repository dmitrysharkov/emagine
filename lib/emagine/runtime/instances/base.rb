module Emagine
  module Runtime
    module Instances
      class Base
        attr_reader :type, :raw_data

        def initialize(type, raw_data)
          @type = type
          @raw_data = raw_data
        end
      end
    end
  end
end
