module Emagine
  module Core
    module Expressions
      class Value < Base
        def initialize(value)
          @value = value
        end

        def evaluate(_scope)
          value
        end
      end
    end
  end
end
