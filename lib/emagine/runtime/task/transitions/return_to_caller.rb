module Emagine
  module Runtime
    class Task
      module Transitions
        class ReturnToCaller < Base
          attr_reader :resolution

          def initialize(task, current_frame, resolution:)
            super
            @resolution = resolution
          end

          def call; end
        end
      end
    end
  end
end
