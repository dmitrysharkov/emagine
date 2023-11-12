module Emagine
  module Parsers
    module RubyLang
      class BytecodeParser
        class AssignProxy
          attr_reader :mutable, :new_var_callback, :new_assigment_callback, :var

          def initialize(mutable:, new_var_callback:, new_assigment_callback:)
            @mutable = mutable
            @new_var_callback = new_var_callback
            @new_assigment_callback = new_assigment_callback
          end

          def []=(name, value)
            create_var(name, value)
            bootstrap_var(value)
          end

          private

          def bootstrap_var(value)
            if value.is_a?(Lang::Script::Node)
              value.lhs = var
            elsif value.is_a?(Lang::Script::Expression)
              new_assigment_callback(var)
            else
              raise 'unexpected right had expression'
            end
          end

          def create_var(name, value)
            @var = new_var_callback.call(name)

            var.mutable = mutable
            var.add_initializer(value)
          end
        end
      end
    end
  end
end

