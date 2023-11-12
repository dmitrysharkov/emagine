# frozen_string_literal: true

# require_relative "emagine/version"

require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.enable_reloading
loader.setup

module Emagine
  class Error < StandardError; end
  # Your code goes here...

  # self.paths = []
  # self.engine =
  #
  # def self.engine(core, host)
  #   Engine.new(core, host)
  # end
  #
  # def self.compile(package, version=nil)
  #   Compiler.new(paths: paths).compile(package, version)
  # end

  # TODO: implement named engines
  # will work like Emagine[:pair_app].run_task(id)

end
