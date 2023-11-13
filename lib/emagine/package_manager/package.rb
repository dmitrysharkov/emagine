module Emagine
  class PackageManager
    class Package
      attr_reader :path, :name, :version

      def initialize(name, version, path)
        @name = name
        @version = version
        @path = path
      end

      def parse
      end


      def find_parser
        ext = File.extname(path)
        case ext
        when 'rb' then Parsers::RubyLang.new
        when 'emagine' then Parsers::EmagineScript::new
        end
      end
    end
  end
end
