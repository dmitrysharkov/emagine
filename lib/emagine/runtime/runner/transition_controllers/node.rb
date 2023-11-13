module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Node < Base
          def exec(procedure)
            @transition = Transitions::ExecProcedure.new(procedure: procedure)
          end
        end
      end
    end
  end
end
