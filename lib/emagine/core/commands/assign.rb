# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class Assign < Base
        attr_accessor :expression, :rhs
      end
    end
  end
end
