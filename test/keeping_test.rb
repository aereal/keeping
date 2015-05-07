require 'minitest/autorun'

describe 'Keeping' do
  it "is ok" do
    required =
      begin
        require 'keeping'
        true
      rescue LoadError
        false
      end
    assert required
    assert defined?(Keeping)
  end
end
