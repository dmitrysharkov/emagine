module Emagine
  module Core
    module Expressions
      class FunctionCall < Base
        def initialize(runnable_proxy , params)
          @params = params
          @runnable = runnable
        end

        def evaluate(scope)
          # todo compile time/run time
          tuple, struct = evaluate_params(scope)
          runnable.call(*tuple, **struct)
        end

        private

        def evaluate_params(scope)
          tuple = params_cortege.tuple.map { |x| x.evaluate(scope) }
          struct = params_cortege.struct.map { |k, v| [k, v.evaluate(scope)] }.to_h
          [tuple, struct]
        end
      end
    end
  end
end
