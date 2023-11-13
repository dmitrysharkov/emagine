module Emagine
  module Runtime
    class Runner
      class TransitionControllers
        def create(current_frame)
          if current_frame.block?
            Block.new(current_frame)
          elsif current_frame.transactional?
            Transactional.new(current_frame)
          else
            Node.new(current_frame)
          end
        end
      end
    end
  end
end
