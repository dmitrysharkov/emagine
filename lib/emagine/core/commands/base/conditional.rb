# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Base
        module Conditional
          attr_accessor :condition

          def meets_condition?(scope)
            return true unless condition # no condition means unconditional
            condition.evaluate(scope)
          end
        end
      end
    end
  end
end
