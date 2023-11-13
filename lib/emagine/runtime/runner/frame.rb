module Emagine
  module Runtime
    class Runner
      module Stack
        class Frame
          attr_reader :runnable, :command_index, :sub_command

          def initialize(runnable, command_index=[0], sub_command = :call)
            @runnable = runnable
            @command_index = command_index
            @sub_command = sub_command
          end

          def proceeding_frame
            self.class.new(runnable, command_index, :proceed)
          end

          def new_command_frame(command_index)
            self.class.new(runnable, command_index)
          end
        end
      end
    end
  end
end
