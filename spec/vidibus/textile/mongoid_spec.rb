require "spec_helper"

class Page
  include Mongoid::Document
  include Vidibus::Textile::Mongoid
  textile :body
end

describe "Vidibus::Textile::Mongoid" do
  let(:page) { Page.new(:body => "h1. Hello World!") }

  it "should add a field :body" do
    page.should respond_to(:body)
  end

  it "should add a field :body_plain" do
    page.should respond_to(:body_plain)
  end

  it "should add a method :body_html" do
    page.should respond_to(:body_html)
  end

  describe "saving" do
    it "should call #set_body_plain" do
      mock(page).set_body_plain
      page.save
    end

    it "should set plain body" do
      mock(page).body_plain=("Hello World!")
      page.save
    end

    it "should not set plain body unless the body has changed" do
      page.save
      dont_allow(page).set_body_plain
      page.save
    end
  end

  describe "#body_plain" do
    it "should plain text from textile field" do
      page.body_plain.should eql("Hello World!")
    end

    it "should not convert textile input if value is available in database" do
      page.save
      dont_allow(Vidibus::Textile).new
      page.body_plain.should eql("Hello World!")
    end

    it "should convert textile input if it has been changed" do
      page.save
      page.body = "h2. This is The End"
      page.body_plain.should eql("This is The End")
    end
  end

  describe "#body_html" do
    it "should return html from textile field" do
      page.body_html.should eql("<h1>Hello World!</h1>")
    end
  end
end
