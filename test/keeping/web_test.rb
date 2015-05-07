require 'minitest/autorun'

require 'keeping/web'

describe 'Keeping::Web' do
  before do
    get '/'
  end

  it "is ok" do
    assert_equal last_response.status, 200
  end
end
