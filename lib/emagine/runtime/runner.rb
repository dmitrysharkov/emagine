module Emagine
  module Runtime
    class Runner
      def initialize(stack)
        @stack = stack
      end

      def run(context)
        step(context) while can_continue?
      end

      def step(context)
        current_frame = stack.pop

        transition_controller = create_transition_controller(current_frame)

        action = current_frame.action

        command.public_send(action, context, transition_controller) # by default command.call(...)

        transition = transition_controller.transition

        transition.call(stack)
      end

      def can_continue?
        !stack.empty?
      end

      private

      def create_transition_controller(current_frame)
        if current_frame.block_command_frame?
          TransitionControllers::Block.new(current_frame)
        elsif context.transactional_mode?
          TransitionControllers::Transactional.new(current_frame)
        else
          TransitionControllers::Node.new(current_frame)
        end
      end
    end
  end
end
