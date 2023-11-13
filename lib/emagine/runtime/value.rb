module Emagine
  module Runtime
    class Value
      attr_reader :type, :value

      def initialize(type)
        @type = type
      end

      def set(value)
        coerced_value = type.coerce(value)
        type.check_concerns(coerced_value)
        @value = coerced_value
      end
    end
  end
end
