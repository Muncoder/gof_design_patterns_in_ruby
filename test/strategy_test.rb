require 'minitest/autorun'
require './lib/strategy'
require './lib/strategy_generators/html'
require './lib/strategy_generators/markdown'

module Newsletter
  describe Generators::Base do
    it "generate a newsletter in HTML" do
      final_result = File.read File.expand_path(
        "fixtures/newsletter.html",
        File.dirname(__FILE__)
      )

      Generators::Base.new(:html).render.must_include final_result
    end

    it "generate a newsletter in Markdown" do
      final_result = File.read File.expand_path(
          "fixtures/newsletter.markdown",
          File.dirname(__FILE__)
      )

      Generators::Base.new(:markdown).render.must_include final_result
    end
  end
end
