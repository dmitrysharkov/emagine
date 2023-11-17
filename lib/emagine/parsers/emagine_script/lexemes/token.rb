module Emagine
  module Parsers
    class EmagineScript
      class ExpressionAst
        module Lexemes
          class Token < Base
            attr_reader :raw_str
            def initialize(raw_str)
              @raw_str = raw_str
            end
            def self.look_ahead(string, start)
              nil
            end
          end
        end
      end
    end
  end
end
