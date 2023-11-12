module Emagine
  module Runtime
    class Task
      class Instruction
        attr_accessor :reference, :address, :scope, :context

        def run(core, host, scope)
          procedure = core.resolve(reference)
          command = procedure.command_at(address)

          if procedure.transaction?
          else

          end
        end
      end
    end
  end
end
