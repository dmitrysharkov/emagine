# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Block
        module Sequential
          # def initial_node(_scope)
          #   children.first
          # end
          #
          # def next_node(_scope, current_node)
          #   children[current_node.position + 1]
          # end

          def call(scope, controller)
            # children.with_index.select { |_idx, x| x.meets_condition?(scope) }
            # choice_idx = children.find_index { |x| x.meets_condition?(scope) }
            # controller.ast_step_down(choice_idx) if choice_idx
            controller.ast_step_down(0)
          end

          def proceed(_scope, controller)
            controller.ast_step_up
          end
        end
      end
    end
  end
end
