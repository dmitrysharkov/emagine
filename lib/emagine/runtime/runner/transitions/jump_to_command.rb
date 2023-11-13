module Emagine
  module Runtime
    class Runner
      module Transitions
        class JumpToCommand < Base
          attr_reader :command_index

          def initialize(command_index:)
            @command_index = command_index
          end

          def call(stack, current_frame)
            new_frame = current_frame.new_command_frame(command_index)
            stack << new_frame
          end
        end
      end
    end
  end
end
