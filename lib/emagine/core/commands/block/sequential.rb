# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Block
        module Sequential
          def initial_node(_scope)
            children.first
          end

          def next_node(_scope, current_node)
            children[current_node.position + 1]
          end
        end
      end
    end
  end
end
