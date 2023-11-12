module Emagine
  module Runtime
    module Scopes
      class Base
        attr_reader :parent_scope, :global_scope
        def initialize(parent_scope)
          @parent_scope = parent_scope
          @global_scope = parent_scope.global_scope if parent_scope
        end
      end
    end
  end
end
