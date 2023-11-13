module Emagine
  module Runtime
    class Runner
      module Stack
        class Frame
          ATTRIBUTES = %i(context scope runnable command_index).freeze
          SETTERS = ATTRIBUTES.map { |k| [k, "#{k}=".to_sym] }.to_h.freeze
          ALLOWED_SUBCOMMANDS = %i(call pcoceed)

          attr_reader :sub_command

          attr_accessor *ATTRIBUTES

          def initialize
            @scope = {}
            @sub_command = :call
            yield self
          end

          def fork(*inherit_params, **new_params)
            new_frame = self.class.new

            inherit_params.each { |k| new_frame[k] = self[name] }
            new_params.each { |k,v| new_frame[k] = v }

            yield self

            new_frame
          end

          def [](name)
            public_send(name.to_sym)
          end

          def []=(name, val)
            public_send(SETTERS[name.to_sym], val)
          end

          def set_sub_command_to_proceed(val)
            @sub_command = :proceed if val
            val
          end
        end
      end
    end
  end
end
