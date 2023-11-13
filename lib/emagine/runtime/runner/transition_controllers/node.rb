module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Node < Transactional
          def wait(event)
            @transition = Transitions::WaitForEvent.new(current_frame, event: event)
          end
        end
      end
    end
  end
end
