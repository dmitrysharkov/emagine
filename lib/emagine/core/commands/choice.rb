# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Choice < Block
        def call(scope, controller)
          # children.with_index.select { |_idx, x| x.meets_condition?(scope) }
          choice_idx = children.find_index { |x| x.meets_condition?(scope) }
          controller.ast_step_down(choice_idx) if choice_idx
        end

        def proceed(_scope, controller)
          controller.ast_step_up
        end
      end
    end
  end
end
