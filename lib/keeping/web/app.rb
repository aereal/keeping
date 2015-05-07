require 'sinatra/base'

module Keeping
  module Web
    class App < Sinatra::Base
      get '/' do
        'ok'
      end
    end
  end
end
