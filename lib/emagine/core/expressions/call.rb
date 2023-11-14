module Emagine
  module Core
    module Expressions
      class FunctionCall < Base
        attr_reader :callable, :expressions_for_ordered_params, :expressions_for_named_params

        def initialize(callable, *expressions_for_ordered_params, **expressions_for_named_params)
          @callable = callable
          @expressions_for_ordered_params = expressions_for_ordered_params
          @expressions_for_named_params = expressions_for_named_params
        end

        def evaluate(context)
          ordered_params = expressions_for_ordered_params.map { |x| x.evaluate(context) }
          named_params = expressions_for_named_params.map { |k, v| [k, v.evaluate(context)] }.to_h

          callable.call(context, *ordered_params, **named_params)
        end
      end
    end
  end
end
