require 'lita-unit-conversion'
require 'lita/rspec'
require 'mock_redis'

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

RSpec.configure do |config|
  config.before(:each) do
    allow(Redis).to receive(:new).and_return(MockRedis.new)
  end
end
