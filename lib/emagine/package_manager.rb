module Emagine
  module PackageManager
    STDLIB_PATH = "#{__dir__}/../../stdlib".freeze

    attr_reader :paths

    def initialize(paths = [])
      @paths = paths + [STDLIB_PATH]
    end

    def compile(name, version)
      source(name, version).compile
    end

    def source(name, version)
      path = resolve_path(name, version)
      Source.new(name, version, path)
    end

    def resolve_path(name, version)
      # implement code here
    end
  end
end
