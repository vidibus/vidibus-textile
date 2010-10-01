require "spec_helper"

describe Vidibus::Textile do
  describe "#to_html" do
    it "should contain textile content as html" do
      textile = Vidibus::Textile.new('Some *say*, "love":http://doit.xxx is a _river_.')
      textile.to_html.should eql('<p>Some <strong>say</strong>, <a href="http://doit.xxx">love</a> is a <em>river</em>.</p>')
    end
  end

  describe "#to_text" do
    it "should not contain plain description without html or textile markup" do
      textile = Vidibus::Textile.new('Some *say*, "love":http://doit.xxx is a _river_.')
      textile.to_text.should eql("Some say, love is a river.")
    end

    it "should not contain RedCloth glyphs" do
      textile = Vidibus::Textile.new(%(<Chief's> "Special" & Sauce (C)))
      textile.to_text.should eql(%(<Chief's> "Special" & Sauce (C)))
    end

    it "should contain newlines" do
      textile = Vidibus::Textile.new("Super\nTrouper")
      textile.to_text.should eql("Super\nTrouper")
    end

    it "should not contain newlines if option :plain is true" do
      textile = Vidibus::Textile.new("Super\nTrouper")
      textile.to_text(:plain => true).should eql("Super Trouper")
    end
  end
end
