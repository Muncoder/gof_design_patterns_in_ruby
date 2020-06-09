require 'minitest/autorun'
require_relative "../lib/product_controller"
require_relative "../lib/product"
require_relative "../lib/product_finder"

describe ProductController do
  it "finds a product" do
    PRODUCT = Product.new "Tomato", :fruit
    controller = ProductController.new
    controller.show(1)

    controller.product.must_equal PRODUCT
  end
end
