module Emagine
  module Runtime
    module Scopes
      class Global < Base
        attr_accessor :core, :host

        def initialize
          super(nil)
          yield self
          @global_scope = self
        end

        def global_scope
          self
        end
      end
    end
  end
end
