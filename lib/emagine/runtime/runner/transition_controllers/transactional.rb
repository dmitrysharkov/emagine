module Emagine
  module Runtime
    class Runner
      module TransitionControllers
        class Transactional < Base
          def exec(runnable)
            @transition = Transitions::ExecRunnable.new(runnable: runnable)
          end
        end
      end
    end
  end
end
