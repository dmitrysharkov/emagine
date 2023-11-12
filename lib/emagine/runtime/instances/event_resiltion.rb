module Emagine
  module Runtime
    module Instances
      class EventResolution
        attr_reader :event, :resolution

        def initialize(event, resolution)
          @event = event
          @resolution = resolution
        end
      end
    end
  end
end
