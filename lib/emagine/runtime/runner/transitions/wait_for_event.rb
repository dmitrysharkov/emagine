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
            new_frame = current_frame.proceeding_frame
            stack << new_frame

            current_frame.context.new_state = :waiting
            current_frame.context.new_expected_event = event
          end
        end
      end
    end
  end
end
