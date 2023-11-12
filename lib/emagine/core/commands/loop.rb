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

        def call(scope, controller)
          if meets_condition?(scope)
            controller.ast_step_down(0)
          else
            controller.ast_step_up
          end
        end

        def proceed(scope, controller)
          prev_child_index = scope.prev_child_index
          new_child_index = prev_child_index + 1
          if new_child_index < children.length
            controller.ast_step_down(new_child_index) # go to the next child
          else
            if meets_condition?(scope)
              controller.ast_step_down(0)
            else
              controller.ast_step_up
            end
          end
        end
      end
    end
  end
end
