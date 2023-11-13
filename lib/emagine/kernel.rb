# frozen_string_literal: true

module Emagine
  class Kernel
    attr_reader :package
    def compile(package, version, paths: [])
      @package = PackageManager.new(paths).compile(package, version)
    end

    def configure(config)
      @package.configure(config)
    end

    def init(host)
    end
  end
  # Your code goes here...
end
