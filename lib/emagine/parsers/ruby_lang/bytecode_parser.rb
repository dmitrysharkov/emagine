module Emagine
  module Parsers
    module RubyLang
      class BytecodeParser
        attr_reader :ast_root

        def initialize(ast_root)
          @ast_root = ast_root
        end

        def build
          yield self
        end

        def if(condition, &block)
          append_child(Lang::Script::Choice.new)
          build_choice_option(condition, &block)
        end

        def elsif(condition, &block)
          build_choice_option(condition, &block)
        end

        def else(&block)
          build_choice_option(nil, &block)
        end

        def let
          append_child(Lang::Script::Assign.new)
          # new_var_callback:, new_assigment_callback
          # AssignProxy.new(true, new_var_callback: ->(name) { ast_root.declare_var(name) },
          #                       new_assigment_callback: ->(var) { append_child(Lang::Script::Ass.new) } )
        end

        def const
        end

        def await(name, *params, **kwargs)
        end

        def async(name, *params, **kwargs)
        end

        def while(condition, &block)

        end

        def loop(&block)
        end

        def last_child
          ast_root.children.last
        end

        private


        def append_child(child)
          ast_root.append(Lang::Script::Choice.new)
        end

        def build_choice_option(condition, &block)
          ChoiceOptionBuilder.new(last_child).call(condition, &block)
        end



        # def build_subtree(root, &block)
        #   self.class.new(root).build(&block)
        # end
      end
    end
  end
end
