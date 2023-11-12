module Emagine
  module Runtime
    class Stack
      attr_reader :instructions

      def initialize
        instructions = []
      end

      def push(instruction)

      end

      def pop
        instructions.pop
      end
    end
  end
end
