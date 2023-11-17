module Emagine
  module Parsers
    module EmagineScript
      module Lexemes
        def self.all
          Base.subclasses
        end

        def self.tokens
          all.select { |x| x < Token }
        end
      end
    end
  end
end
