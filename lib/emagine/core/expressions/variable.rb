module Emagine
  module Core
    module Expressions
      class Variable < Base
        def initialize(name)
          @name = name.to_sym
        end

        def evaluate(context)
          context.lexical_scope[name]
        end
      end
    end
  end
end
