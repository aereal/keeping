require 'sinatra/base'
require 'keeping/web/middleware/logger'

module Keeping
  module Web
    class App < Sinatra::Base
      use Keeping::Web::Middleware::Logger

      get '/' do
        'ok'
      end
    end
  end
end
