require 'minitest/autorun'
require_relative "../lib/product"
require_relative "../lib/product_controller"

PRODUCT = Product.new("Tomato", :fruit)

describe ProductController do
  it "cannot be accessed more than once" do
    -> { ProductController.new }.must_raise NoMethodError
  end

  it "retrives a product" do
    controller = ProductController.instance
    controller.show
    controller.product.must_equal PRODUCT
  end
end