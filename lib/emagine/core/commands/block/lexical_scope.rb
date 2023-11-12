# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Block
        class LexicalScope
          include Enumerable

          attr_accessor :items

          def initialize
            @items = {}
          end

          def add(name)
            name = name.to_sym
            var = Variable.new
            var.name = name
            items[name] = var
            var
          end

          def [](name)
            items[name.to_sym]
          end

          def each(&block)
            if block_given?
              @items.values.each(&block)
            else
              to_enum(:each)
            end
          end
        end
      end
    end
  end
end
