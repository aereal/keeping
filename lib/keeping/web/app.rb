require 'sinatra/base'

require 'keeping/web/middleware/logger'

module Keeping
  module Web
    class App < Sinatra::Base
      configure :development do
        require 'sinatra/reloader'
        register Sinatra::Reloader
      end

      use Keeping::Web::Middleware::Logger

      get '/' do
        'ok'
      end
    end
  end
end
