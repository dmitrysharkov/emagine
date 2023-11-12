module Emagine
  module Runtime
    class Task
      module Transitions
        class WaitForEvent < Base
          attr_reader :event, :params

          def initialize(task, current_frame, event:, params:)
            super
            @event = event
            @params = params
          end

          def call
            new_frame = StackFrame.new do |inst|
              inst.context = task.context
              inst.procedure = current_frame.procedure
              inst.command_index = current_frame.command_index
              inst.proceed!
            end

            push_new_frame(new_frame)
            wait_for_event(event, params)
          end
        end
      end
    end
  end
end
