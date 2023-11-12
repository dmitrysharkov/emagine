# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Choice < Block
        def initial_node(scope)
          children.detect { |x| x.meets_condition?(scope) }
        end

        def next_node(scope, current_node)
          nil
        end
      end
    end
  end
end
