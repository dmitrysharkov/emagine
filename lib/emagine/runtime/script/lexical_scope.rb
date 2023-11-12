module Emagine
  module Runtime
    class Script
      class LexicalScope
        def initialize(context, frame)
          @context = context
          @frame = frame
        end

        def [](name)
        end

        def []=(name)
        end
      end
    end
  end
end
