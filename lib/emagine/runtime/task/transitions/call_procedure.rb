module Emagine
  module Runtime
    class Task
      module Transitions
        class ProceedToChild < Base
          attr_reader :procedure

          def initialize(task, current_frame, procedure:)
            super
            @procedure = procedure
          end

          def call
            push_new_frame(caller_frame)
            push_new_frame(callee_frame)
          end

          private

          def caller_frame
            StackFrame.new do |inst|
              inst.context = task.context
              inst.procedure = current_frame.procedure
              inst.command_index = current_frame.command_index

              inst.proceed!
            end
          end

          def callee_frame
            StackFrame.new do |inst|
              inst.context = task.context
              inst.procedure = current_frame.procedure
              inst.command_index = [0]
            end
          end
        end
      end
    end
  end
end
