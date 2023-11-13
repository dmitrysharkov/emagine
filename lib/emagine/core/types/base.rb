module Emagine
  module Core
    module Types
      class Base
        attr_reader :coercers, :constraints, :parent_type

        def initializer
          @coercers = []
          @constraints = []
          @parent_type = nil
        end

        def coerce(value)
          if value.is_a?(Types::Base)
          else
          end
        end

        def coerce_internal_type(value)
          # case value
          # when Integer then Scalars::Int.from_native(value)
          # when Float
          # when True
          #
          # when String
          # end
        end

        def check_concerns(value)

        end
      end
    end
  end
end
