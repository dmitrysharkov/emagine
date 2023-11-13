module Emagine
  module Runtime
    class Runner
      module Transitions
        class WaitForEvent < Base
          attr_reader :event

          def initialize(event:)
            @event = event
          end

          def call(stack, current_frame)
            new_frame = current_frame.fork(:context, :runnable, :command_index, set_sub_command_to_proceed: true)
            stack << new_frame

            current_frame.context.new_state = :waiting
            current_frame.context.new_expected_event = event
          end
        end
      end
    end
  end
end
