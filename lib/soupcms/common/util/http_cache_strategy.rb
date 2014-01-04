module SoupCMS
  module Common
    module Util


      class HttpCacheStrategy

        DEFAULT_MAX_AGE = 60 * 5 # 5 minutes
        @@max_age = DEFAULT_MAX_AGE

        def self.default_max_age=(seconds)
          @@max_age = seconds
        end

        def max_age
          @@max_age
        end

        def headers(params)
          return {} if (params['include'] == 'drafts') || (ENV['RACK_ENV'] != 'production')
          {
              'Cache-Control' => "public, max-age=#{max_age}",
              'Expires' => CGI.rfc1123_date(Time.now.utc + max_age)
          }
        end

      end


    end
  end
end

