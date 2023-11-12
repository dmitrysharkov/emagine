# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Block < Base
        include Enumerable

        attr_reader :children, :variables

        def initialize
          @children = []
          @variables = LexicalScope.new
        end

        def append(child)
          child.position = children.size
          children << child
          child
        end

        def declare_var(name)
          variables.add(name)
        end

        def [](idx)
          items[idx]
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
