module Emagine
  module Runtime
    module Scopes
      class Local < Base
        def initialize(parent_scope)
          @parent_scope = parent_scope
          @global_scope = parent_scope.global_scope
        end

        def [](name)
        end
      end
    end
  end
end
