module Emagine
  module Core
    module Expressions
      class Variable < Base
        def initialize(variable)
          @variable = variable
        end

        def evaluate(scope)
          scope.value
        end
      end
    end
  end
end
