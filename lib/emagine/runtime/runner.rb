module Emagine
  module Runtime
    class Runner
      def initialize(context, stack)
        @context = context
        @stack = stack
      end

      def run
        step while can_continue?
      end

      def step
        current_frame = stack.pop

        transition_controller = create_transition_controller(current_frame)
        scope = LexicalScope.new(context, current_frame)

        command.public_send(sub_command, scope, transition_controller)  # by default command.call(...)

        transition_controller.run_transition
      end

      def can_continue?
        !stack.empty?
      end

      private

      def create_transition_controller(current_frame)
        if block_command?(current_frame)
          Block.new(context, stack, current_frame)
        elsif context.transactional_mode?
          Transactional.new(context, stack, current_frame)
        else
          Node.new(context, stack, current_frame)
        end
      end

      def block_command?(current_frame)
        procedure = current_frame.procedure[current_frame.command_index].block?
      end
    end
  end
end
