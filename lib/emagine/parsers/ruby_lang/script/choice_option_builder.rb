module Emagine
  module Parsers
    module RubyLang
      class BytecodeParser
        class ChoiceOptionBuilder
          attr_reader :prev_node

          def initialize(choice_node)
            @prev_node = choice_node
          end

          def call(condition, &block)
            raise 'if statement missed' unless prev_node.is_a?(Lang::Script::Choice)

            option = Lang::Script::ChoiceOption.new { |x| x.condition = condition }
            LangBuilders::Script.new(prev_node).build(&block)

            prev_node.append(option)

            option
          end
        end
      end
    end
  end
end
