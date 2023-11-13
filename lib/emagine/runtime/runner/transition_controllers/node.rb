module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Node < Transactional
          def wait(event)
            @transition = Transitions::WaitForEvent.new(event: event)
          end
        end
      end
    end
  end
end
