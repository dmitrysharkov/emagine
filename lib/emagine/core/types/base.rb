module Emagine
  module Core
    module Types
      class Base
        attr_accessor :coercers, :constraints

        def initializer
          @coercers = []
          @constraints = []
        end

        def inherit
          child = self.class.new
          child.coercers = coercers.dup
          child.constraints = constraints.dup
          child
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

        def specify_child(child)

        end
      end
    end
  end
end
