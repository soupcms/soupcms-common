module SoupCMS
  module Common

    class Route

      def initialize(key, controller_class)
        @key_parts = key.split('/')
        @controller_class = controller_class
      end

      attr_reader :key_parts, :controller_class

      def match(url_parts)
        return false if url_parts.size != key_parts.size
        key_parts.each_index do |index|
          key = key_parts[index]
          next if key.match(/^:/)
          return false if key != url_parts[index]
        end
        true
      end

      def params(url_parts)
        params = {}
        key_parts.each_index do |index|
          key = key_parts[index]
          if key.match(/^:/)
            params[key.match(/^:/).post_match] = url_parts[index]
          end
        end
        params
      end

    end


  end
end
