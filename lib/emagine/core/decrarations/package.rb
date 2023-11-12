# frozen_string_literal: true

module Emagine
  module Core
    module Declarations
      class Package < Base
        attr_reader :procedures, :functions, :types, :events, :interfaces, :dependencies, :aliases
      end
    end
  end
end
