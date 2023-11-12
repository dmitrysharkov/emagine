module Emagine
  module Runtime
    class Task
      class Event
        attr_reader :expected_event, :expected_event_data, :received_event, :received_event_data
      end
    end
  end
end
