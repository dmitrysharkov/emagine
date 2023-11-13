module Emagine
  module Runtime
    class Runner
      module Transitions
        class ExecProcedure < Base
          attr_reader :procedure

          def initialize(procedure:)
            @procedure = procedure
          end

          def call(stack, current_frame)
            caller_frame = current_frame.fork(:context, :runnable, :command_index, set_sub_command_to_proceed: true)
            stack << caller_frame

            callee_frame = current_frame.fork(:context, runnable: procedure, command_index: [0])
            stack << callee_frame
          end
        end
      end
    end
  end
end
