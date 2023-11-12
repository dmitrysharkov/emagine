module Emagine
  module Runtime
    class Task
      module TransitionControllers
        def self.create(task, current_frame)
          if current_frame.block_command?
            Block.new(task, current_frame)
          else
            Node.new(task, current_frame)
          end
        end
      end
    end
  end
end
