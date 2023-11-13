module Emagine
  module Runtime
    class Runner
      module Transitions
        class ExecRunnable < Base
          attr_reader :runnable

          def initialize(current_frame, runnable:)
            super
            @procedure = runnable
          end

          def call(stack)
            caller_frame = current_frame.proceeding_frame
            stack << caller_frame

            callee_frame = Frame.new(runnable)
            stack << callee_frame
          end
        end
      end
    end
  end
end
