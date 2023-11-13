module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Block < Base
          def ast_step_down(child_index)
            full_index = current_frame.command_index + [child_index]
            @transition = Transitions::JumpToCommand.new(current_frame, command_index: full_index)
          end
        end
      end
    end
  end
end
