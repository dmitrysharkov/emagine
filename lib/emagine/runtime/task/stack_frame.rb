module Emagine
  module Runtime
    class Task
      class StackFrame
        attr_accessor :context, :scope, :procedure, :command_index, :sub_command
        # attr_accessor :reference, :address, :scope, :context
        def initialize
          @scope = {}
          @sub_command = :call
          yield self
        end

        def run(transition_manager)
          visible_scope = VisibleScope.new(procedure, command_index_code, context, scope)
          command.public_send(sub_command, visible_scope, transition_manager)
        end

        def proceed!
          @sub_command = :proceed
        end

        def block_command?
          command.is_a?(Core::Commands::Block)
        end

        def command
          @command ||= procedure[command_index_code]
        end

        def command_index_code
          @command_index_code ||= command_index.join('.').to_sym
        end
      end
    end
  end
end
