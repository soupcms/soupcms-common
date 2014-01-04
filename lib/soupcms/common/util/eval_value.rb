module SoupCMS
  module Common
    module Util

      class EvalValue

        def initialize(value)
          @value = value
        end

        attr_reader :value

        def eval_value
          (number? || boolean? || matcher?) ? eval(value) : value
        end

        def number?
          !value.match(/^([+-]?)\d*([\.]?)\d*$/).nil?
        end

        def boolean?
          value == 'true' || value == 'false'
        end

        def matcher?
          !value.match(/^\/.*\/$/).nil?
        end

      end


    end
  end
end
