$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "rspec"
require "vidibus-textile"

RSpec.configure do |config|
  config.mock_with :rr
end