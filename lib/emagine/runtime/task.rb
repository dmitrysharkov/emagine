module Emagine
  module Runtime
    class Task
      attr_accessor :id, :state, :stack, :flags, :parent_id, :context

      def initialize(core, host, id)
        @core = core
        @host = host
        @id = id
      end

      def run
        init

        while continue?
          reset_last_result
          perform_next_instruction
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
        !stack.empty? && !error?
      end

      def init
        @global_scope = create_global_scope
        snapshot = host.receive_task_exclusivelly(id)
        deserialize(snapshot)
      end

      def perform_next_instruction
        instruction = stack.pop

        transition = instruction.run
        transition.from = instruction

        if transition.transit?
          stack.push(transition.new_instruction)
        elsif transition.error?
          process_error(transition.error)
        else
          global_scope.result = transition.result
        end
      end

      def serialize
        # this task state to
      end

      def finalize
      end

      def deserialize(snapshot)
      end

      def hibernate
        self.state = error? ? 'error' : 'ready'
        snapshot = serialize
        host.save_task(id, snapshot)
      end

      def create_global_scope
        Scopes::Global.new do |s|
          s.host = host
          s.core = core
          s.expected_event = expected_event
          s.received_event = received_event
        end
      end

      def reset_last_result
        global_scope.last_error = nil
        global_scope.last_result = nil
      end

      def process_error(error)
        if error.user?
          global_scope.last_error = error
        else
          global_scope.system_error = error
        end
      end

      def error?
        !global_scope.system_error.nil?
      end

      def fetch_flags
        flags = host.receive_task_flags(id)
      end
    end
  end
end
