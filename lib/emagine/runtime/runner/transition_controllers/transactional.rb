module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Transactional < Node
          def wait(event)
            @transition = Transitions::WaitForEvent.new(event: event)
          end
        end
      end
    end
  end
end
