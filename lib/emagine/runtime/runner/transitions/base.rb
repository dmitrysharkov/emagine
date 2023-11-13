module Emagine
  module Runtime
    class Runner
      module Transitions
        class Base
          attr_reader :current_frame

          def initialize(current_frame)
            @current_frame = current_frame
          end
        end
      end
    end
  end
end
