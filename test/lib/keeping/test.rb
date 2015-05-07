require 'rack/test'
require 'minitest/spec'

require 'keeping/web'

class Minitest::Spec
  include Rack::Test::Methods

  def app
    @app ||= Keeping::Web.new
  end
end
