require 'rack/request'
require 'rack/response'

module Keeping
  class Web
    def call(env)
      request = Rack::Request.new(env)
      response = Rack::Response.new
      response.finish
    end
  end
end
