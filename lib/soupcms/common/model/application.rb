module SoupCMS
  module Common
    module Model

      class Application


        def initialize(name, display_name, soupcms_api_url, app_base_url, mongo_uri = nil, configs = {})
          @name = name
          @display_name = (display_name || name)
          @soupcms_api_url = soupcms_api_url
          @app_base_url = app_base_url
          @mongo_uri = mongo_uri || ENV["MONGODB_URI_#{name}"] || ENV["MONGOLAB_URI"] || "mongodb://localhost:27017/#{name}"
          @configs = {'name' => name, 'display_name' => display_name, 'soupcms_api_url' => soupcms_api_url, 'app_base_url' => app_base_url, 'mongo_uri' => mongo_uri}.merge! configs
        end

        attr_reader :name, :display_name, :soupcms_api_url, :app_base_url, :mongo_uri, :configs

        def [](key)
          configs[key] || ENV["#{key}_#{name}"]
        end

      end

    end
  end
end
