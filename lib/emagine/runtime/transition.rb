# frozen_string_literal: true

module Emagine
  module Runtime
    class Transition
      attr_accessor :new_instruction, :result, :error, :from

      def transit?
        !new_instruction.nil?
      end

      def success?
        !result.nil?
      end

      def error?
        !error?
      end
    end
  end
end
