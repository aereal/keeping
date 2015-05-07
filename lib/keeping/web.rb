require 'sinatra/base'

module Keeping
  class Web < Sinatra::Base
    get '/' do
      'ok'
    end
  end
end
