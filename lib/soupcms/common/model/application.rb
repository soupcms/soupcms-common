module SoupCMS
  module Common
    module Model

      class Application


        def initialize(name, display_name, soupcms_api_url, app_base_url, mongo_uri = nil)
          @name = name
          @display_name = (display_name || name)
          @soupcms_api_url = soupcms_api_url
          @app_base_url = app_base_url
          @mongo_uri = mongo_uri || "mongodb://localhost:27017/#{name}"
        end

        attr_reader :name, :display_name, :soupcms_api_url, :app_base_url, :mongo_uri

      end

    end
  end
end
