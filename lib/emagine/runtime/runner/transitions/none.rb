module Emagine
  module Runtime
    class Runner
      module Transitions
        class None < Base
          def call(_stack, _current_frame); end
        end
      end
    end
  end
end
