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

        transition_controller = TransitionControllers.create(current_frame)

        action = current_frame.action

        command.public_send(action, context, transition_controller) # by default command.call(...)

        transition = transition_controller.transition

        transition.call(stack)
      end

      def can_continue?
        !stack.empty?
      end
    end
  end
end
