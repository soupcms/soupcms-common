module SoupCMS
  module Common

    class Router

      def initialize
        @routes = []
      end

      attr_reader :routes

      def add(route, controller_class, model_name = nil)
        add_route Route.new(route, controller_class, model_name)
      end

      def add_route(route)
        routes.push route
      end

      def default(controller_class)
        @default_controller_class = controller_class
      end

      def resolve(path, params)
        url_parts = path.split('/')
        matched_route = routes.find { |route| route.match(url_parts) }
        if matched_route
          matched_route.params(url_parts).each { |key, value| params[key] = value }
          return matched_route.controller_class
        elsif @default_controller_class
          params['slug'] = path
          return @default_controller_class
        end
      end

    end



  end
end
