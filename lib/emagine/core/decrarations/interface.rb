# frozen_string_literal: true

module Emagine
  module Core
    module Declarations
      class Interface < Base
        attr_reader :parent
        attr_accessor :params_cortege, :result_cortege, :errors
        protected  :params_cortege=, :result_cortege=, :errors=

        def initialzie
          @params_cortege = Types::Cortege.new
          @result_cortege = Types::Cortege.new
        end

        def inherit
          child = self.class.new

          child.params_cortege = params_cortege.inherit
          child.result_cortege = result_cortege.inherit
          child.errors = errors.dup
        end
      end
    end
  end
end
