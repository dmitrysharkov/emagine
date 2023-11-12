module Emagine
  module Runtime
    class Script
      module Transitions
        class ExecProcedure < Base
          attr_reader :procedure

          def initialize(procedure:)
            @procedure = procedure
          end

          def call(context, stack)
            caller_frame = context.fork(:context, :procedure, :command_index, set_sub_command_to_proceed: true)
            stack << caller_frame

            callee_frame = context.fork(:context, procedure: procedure, command_index: [0])
            stack << callee_frame
          end
        end
      end
    end
  end
end
