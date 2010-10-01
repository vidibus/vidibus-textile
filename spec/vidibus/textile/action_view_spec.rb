require "spec_helper.rb"
require "action_view"

describe ActionView::Base do
  describe "#stripped" do
    it "should call Vidibus::Textile::Doc#to_text" do
      mock.any_instance_of(Vidibus::Textile::Doc).to_text({})
      subject.stripped("something")
    end

    it "should accept options" do
      mock.any_instance_of(Vidibus::Textile::Doc).to_text(:plain => true)
      subject.stripped("something", :plain => true)
    end

    it "should work as intended" do
      subject.stripped('Some *say*, "love":http://doit.xxx is a _river_.').should eql("Some say, love is a river.")
    end

    it "should handle empty content" do
      dont_allow.any_instance_of(Vidibus::Textile::Doc).to_text({})
      subject.stripped(nil).should eql("")
    end
  end
end
