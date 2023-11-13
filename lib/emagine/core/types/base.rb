module Emagine
  module Core
    module Types
      class Base
        attr_reader :coercers, :constraints, :parent_type

        def initializer(parent_type = nil)
          @coercers = []
          @constraints = []
          @parent_type = parent_type
        end

        def coerce(value)
          value = coerce_internal_type(value) unless value.is_a?(Types::Base)
          return value if value.type == self
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

        def check_constraints(value)
          constraints.each { |x| x.check(value) }
          parent_type.check_constraints(value) unless parent_type
        end

        def extend
          self.class.new(self)
        end
      end
    end
  end
end
