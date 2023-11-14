# frozen_string_literal: true

module Emagine
  module Core
    module Declarations
      class Cortege < Base
        class AttributesManager
          attr_reader :ordered
          attr_reader :hash

          def initialize
            @ordered = []
            @hash = {}
          end

          def <<(attribute)
            ordered << attribute if attribute.ordered?
            hash[attribute.name] = attribute
          end

          def [](idx)
            case idx
            when Integer then ordered[idx]
            when String, Symbol then  hash[idx]
            else
              raise Error, "invalid attribute index #{idx}"
            end
          end
        end
      end
    end
  end
end
