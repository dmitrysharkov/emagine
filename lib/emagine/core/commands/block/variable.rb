# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Block
        class Variable
          attr_accessor :name, :mutable
          attr_reader :initializers

          def initialize
            @initializers = []
          end

          def add_initializer(initializer)
            initializers << initializer
          end
        end
      end
    end
  end
end
