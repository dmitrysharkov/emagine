module Emagine
  module Runtime
    class Task
      module Transitions
        class Base
          attr_reader :task, :current_frame

          def initialize(task, current_frame)
            @task = task
            @current_frame = current_frame
          end

          private

          def push_new_frame(frame)
            task.stack << callee_frame
          end

          def wait_for_event(name, params)
            task.state = :waiting
            task.expected_event = name
            task.expected_event_params = params
          end
        end
      end
    end
  end
end
