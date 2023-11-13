module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Base
          attr_reader :current_frame, :transition

          def initialize(current_frame)
            @current_frame = current_frame
          end

          def resolve(resolution)
            context.last_resolution = resolution
            ast_step_up
          end

          def ast_step_up
            if current_frame.index.length > 1
              parent_index = current_frame.index[0..-2]
              @transition = Transitions::JumpToCommand.new(current_frame, command_index: parent_index)
            else
              Transitions::None.new(current_frame)
            end
          end
        end
      end
    end
  end
end
