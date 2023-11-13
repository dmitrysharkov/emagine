module Emagine
  module Runtime
    class Runner
      module Stack
        class Frame
          attr_reader :runnable, :command_index, :action

          def initialize(runnable, command_index=[0], action = :call)
            @runnable = runnable
            @command_index = command_index
            @action = action
          end

          def proceeding_frame
            self.class.new(runnable, command_index, :proceed)
          end

          def new_command_frame(command_index)
            self.class.new(runnable, command_index)
          end

          def block_command_frame?
            runnable.commands[command_index].block?
          end
        end
      end
    end
  end
end
