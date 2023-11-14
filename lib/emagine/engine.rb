# frozen_string_literal: true

module Emagine
  class Engine  # rename to endpoint?
    attr_reader :core, :host

    def initialize(core, host)
      @core = core
      @host = host
    end

    def emit(name, *params, **kwargs)
    end

    def emit_error(name, *params, **kwargs)
    end

    def delegate(name, *params, **kwargs)
    end

    def start(name, *params, **kwargs)
    end

    def exec(name, *params, **kwargs)
    end

    def rpc_result(id, *params, **kwargs)

    end

    def rpc_error(id, error_name, *params, **kwargs)
    end

    def run_task(id)
      Runtime::Task.new(core, host, id).run
    end
  end
end

