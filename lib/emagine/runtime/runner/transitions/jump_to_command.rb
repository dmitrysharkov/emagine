module Emagine
  module Runtime
    class Runner
      module Transitions
        class JumpToCommand < Base
          attr_reader :command_index

          def initialize(current_frame, command_index:)
            super
            @command_index = command_index
          end

          def call(stack)
            new_frame = current_frame.new_command_frame(command_index)
            stack << new_frame
          end
        end
      end
    end
  end
end
