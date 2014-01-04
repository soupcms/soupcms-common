module SoupCMS
  module Common
    module Controller

      class BaseController

        def initialize(context)
          @context = context
        end

        attr_reader :context

        def execute
          raise 'Implement method execute'
        end

      end


    end
  end
end
