# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Block
        module Sequential
          def call(scope, controller)
            controller.ast_step_down(0)
          end

          def proceed(scope, controller)
            prev_child_index = scope.prev_child_index
            new_child_index = prev_child_index + 1
            if new_child_index < children.length
              controller.ast_step_down(new_child_index) # go to the next child
            else
              controller.ast_step_up
            end
          end
        end
      end
    end
  end
end
