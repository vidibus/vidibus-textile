$:.unshift File.expand_path('../../', __FILE__)

require "rubygems"
require "rspec"
require "rr"
require "vidibus-textile"

Mongoid.configure do |config|
  config.connect_to('vidibus-textile')
end

RSpec.configure do |config|
  config.mock_with :rr
  config.before(:each) do
    Mongoid::Sessions.default.collections.
      select {|c| c.name !~ /system/}.each(&:drop)
  end
end
