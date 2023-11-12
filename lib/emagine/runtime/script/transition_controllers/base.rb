module Emagine
  module Runtime
    class Script
      module TransitionControllers
        class Base
          attr_reader :context, :stack, :current_frame, :transition

          def initialize(context, stack, current_frame)
            @context = context
            @stack = stack
            @current_frame = current_frame
          end

          def resolve(resolution)
            context.last_resolution = resolution
            ast_step_up
          end

          def run_transition
            transition.call(:context, :stack)
          end

          def ast_step_up
            if current_frame.index.length > 1
              parent_index = current_frame.index[0..-2]
              @transition = Transitions::JumpToCommand.new(command_index: parent_index)
            else
              Transitions::None.new
            end
          end
        end
      end
    end
  end
end
