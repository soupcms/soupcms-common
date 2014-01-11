module SoupCMS
  module Common

    class Route

      def initialize(key, controller_class, model_name = nil)
        @key_parts = key.split('/')
        @controller_class = controller_class
        @model_name = model_name
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
        params['model_name'] = @model_name if @model_name
        params['_slug_keys'] = []
        key_parts.each_index do |index|
          key = key_parts[index]
          if key.match(/^:/)
            key_without_prefix = key.match(/^:/).post_match
            params[key_without_prefix] = url_parts[index]
            params['_slug_keys'].push key_without_prefix
          end
        end

        params
      end

    end


  end
end
