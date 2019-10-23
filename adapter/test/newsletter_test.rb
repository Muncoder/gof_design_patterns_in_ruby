# require 'test_helper'
require 'rubygems'
require 'nokogiri'
require 'minitest/autorun'
require "json"
require_relative '../lib/newsletter/content'
require_relative '../lib/newsletter/content'
require_relative '../lib/newsletter/adapters/json'
require_relative '../lib/newsletter/adapters/xml'

module Newsletter
  describe Content do
    describe "parsing content from JSON" do

      before do
        @json = File.read File.expand_path(
            "fixtures/newsletter.json",
            File.dirname(__FILE__)
        )
        @content = Content.parse(@json, :json)
      end

      it "parses the title" do
        @content.title.must_equal "Hello World!"
      end

      it "parses the body" do
        @content.body.must_equal "lorem ipsum"
      end
    end

    describe "parsing content from an XML file" do
      before do
        @xml = File.read File.expand_path(
            "fixtures/newsletter.xml",
            File.dirname(__FILE__)
        )

        @content = Content.parse(@xml, :xml)
      end

      it "parses the title" do
        @content.title.must_equal "Hello World!"
      end

      it "parses the body" do
        @content.body.must_equal "lorem ipsum"
      end

    end
  end
end
