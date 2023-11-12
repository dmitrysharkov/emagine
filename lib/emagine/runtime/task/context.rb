module Emagine
  module Runtime
    class Task
      class Context < Runtime::Context
        attr_accessor :new_expected_event, :new_state
      end
    end
  end
end
