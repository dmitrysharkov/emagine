module Emagine
  module Runtime
    class Task
      module TransitionControllers
        class Base
          attr_reader :task, :current_frame, :transition

          def initialize(task, current_frame)
            @current_frame = current_frame
            @task = task
          end

          def resolve(resolution)
            @transition = back_to_parent(resolution)
          end

          def run_transition
            transition.call
          end

          private

          def back_to_parent(resolution)
          end

          def back_to_caller

          end
        end
      end
    end
  end
end
