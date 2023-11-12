module Emagine
  module Runtime
    class Task
      module Transitions
        class ReturnToParent < ReturnToCaller
          def call
            new_frame = StackFrame.new do |inst|
              inst.context = task.context
              inst.procedure = current_frame.procedure
              inst.command_index = current_frame.command_index[0..-2]
              inst.proceed!
            end

            push_new_frame(new_frame)
          end
        end
      end
    end
  end
end
