# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Base < Core::Base
        attr_accessor :position, :lhs

        def initialize
          yield self
        end
      end
    end
  end
end
