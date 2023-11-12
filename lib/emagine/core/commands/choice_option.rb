# frozen_string_literal: true

module Emagine
  module Core
    module Commands
      class ChoiceOption < Block
        include Base::Conditional
        include Block::Sequential
      end
    end
  end
end
