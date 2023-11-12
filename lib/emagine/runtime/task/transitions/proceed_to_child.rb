module Emagine
  module Runtime
    class Task
      module Transitions
        class ProceedToChild < Base
          attr_reader :child_index

          def initialize(task, current_frame, child_index:)
            super
            @child_index = child_index
          end

          def call
            new_frame = StackFrame.new do |inst|
              inst.context = task.context
              inst.procedure = current_frame.procedure
              inst.command_index = current_frame.command_index + [child_index]
            end

            push_new_frame(new_frame)
          end
        end
      end
    end
  end
end
