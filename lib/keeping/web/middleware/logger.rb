require 'rack/commonlogger'

module Keeping
  module Web
    module Middleware
      class Logger < Rack::CommonLogger
        FIELDS  = %w( path ua time status method query referrer runtime user size host version vhost )
        FORMATS = FIELDS.map {|field| "#{field}:%{#{field}}" }
        FORMAT  = FORMATS.join("\t") + "\n"

        def log(env, status, header, began_at)
          now = Time.now
          length = extract_content_length(header)

          logger = @logger || env['rack.errors']
          logger.write FORMAT % {
            path:     env['PATH_INFO'],
            ua:       env['HTTP_USER_AGENT'] || '-',
            time:     now.strftime('%Y-%m-%dT%H:%M:%S%z'),
            status:   status.to_s[0..3],
            method:   env['REQUEST_METHOD'],
            query:    env['QUERY_STRING'].empty? ? '-' : '?' + env['QUERY_STRING'],
            referrer: env['HTTP_REFERER'] || '-',
            runtime:  header['X-Runtime'] || ('%0.6f' % (now - began_at)),
            user:     env['REMOTE_USER'] || '-',
            size:     length || '-',
            host:     env['HTTP_X_FORWARDED_FOR'] || env['REMOTE_ADDR'] || '-',
            version:  env['HTTP_VERSION'],
            vhost:    env['HTTP_X_FORWARDED_HOST'] || env['HTTP_HOST'] || env['SERVER_NAME'] || '-',
          }
        end
      end
    end
  end
end
