module Emagine
  module Parsers
    class EmagineScript
      class ExpressionAst
        module Lexemes
          class Symbol < Token
            def self.look_ahead(string, start)
              return nil unless string[]
            end
          end
        end
      end
    end
  end
end
