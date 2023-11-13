module Emagine
  module Runtime
    class Task
      attr_accessor :id, :state,  :flags, :parent_id, :context, :script, :stack

      def initialize(kernel, host, id)
        @context = Task::Context.new(kernel, host)
        @id = id
      end

      def run
        init

        while continue?
          # reset_last_result
          perform_next_frame
          fetch_flags
        end

        if done?
          finalize
        else
          hibernate
        end
      end

      private

      attr_reader :result

      def continue?
        !signals? && !running? && !stack_empty? && !hibernate?
      end

      def init
        snapshot = host.receive_task_exclusivelly(id)
        deserialize(snapshot)
      end

      def stack_empty?
        stack.empty?
      end

      def signals?
        false
      end

      def serialize
        # this task state to
      end

      def finalize
      end

      def deserialize(snapshot)
      end

      def hibernate
        # self.state = error? ? 'error' : 'ready'
        # snapshot = serialize
        # host.save_task(id, snapshot)
      end

      def hibernate?
        return false if transactional?
        got_time_left?
      end

      def got_time_left?
        true
      end

      # def process_error(error)
      #   if error.user?
      #     global_scope.last_error = error
      #   else
      #     global_scope.system_error = error
      #   end
      # end

      def running?
        state == :running
      end

      def fetch_flags
        flags = host.receive_task_flags(id)
      end
    end
  end
end
