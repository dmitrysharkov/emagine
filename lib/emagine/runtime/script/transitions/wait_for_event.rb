module Emagine
  module Runtime
    class Script
      module Transitions
        class WaitForEvent < Base
          attr_reader :event

          def initialize(event:)
            @event = event
          end

          def call(context, stack)
            new_frame = current_frame.fork(:context, :procedure, :command_index, set_sub_command_to_proceed: true)
            stack << new_frame

            context.new_state = :waiting
            context.new_expected_event = event
          end
        end
      end
    end
  end
end
