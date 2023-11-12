module Emagine
  module Runtime
    class Script
      module Transitions
        class JumpToCommand < Base
          attr_reader :command_index

          def initialize(command_index:)
            @command_index = command_index
          end

          def call(_context, stack)
            new_frame = current_frame.fork(:context, :procedure, command_index: command_index)
            stack << new_frame
          end
        end
      end
    end
  end
end
