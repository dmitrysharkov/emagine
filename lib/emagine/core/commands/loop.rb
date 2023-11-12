# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Loop < Block
        include Base::Conditional

        def initial_node(scope)
          return nil unless meets_condition?(scope)

          children.first
        end

        def next_node(scope, prev_node)
          return nil if prev_node.is_a?(Break)
          return nil unless meets_condition?(scope)

          # TODO: implement internal iterations counter to prevent infinity loops

          children[prev_node.position + 1]
        end
      end
    end
  end
end
