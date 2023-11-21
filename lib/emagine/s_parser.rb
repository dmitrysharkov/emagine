# frozen_string_literal: true

module Emagine
  module SParser
    require_relative "s_parser/yy_parse"
    def self.parse(str)
      YYParse.parse(str)
    end
  end
  # Your code goes here...
end
