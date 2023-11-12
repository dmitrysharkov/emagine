module Emagine
  module Runtime

    class Context
      attr_reader :core, :host

      attr_accessor :transactional_mode, :last_resolution

      def initialize(core, host)
        @core = core
        @host = host
        @last_resolution = nil
        @transactional_mode = false
      end

      def transactional_mode?
        transactional_mode
      end
    end
  end
end
