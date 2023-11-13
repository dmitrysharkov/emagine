module Emagine
  module Parsers
    class Base
      attr_reader :path
      def initialize(path)
        @path = path
      end
    end
  end
end
