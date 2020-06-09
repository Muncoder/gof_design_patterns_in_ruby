require 'minitest/autorun'
require_relative "../lib/user"
require_relative "../lib/manager"
require_relative "../lib/factory"
require_relative "../lib/exceptions/forbidden_access"

describe PaymentServiceFactory do
  let(:user) { User.new "John Doe" }
  let(:manager) { Manager.new "The Boss" }

  it "allows user to perform payments" do
    service = PaymentServiceFactory.for manager
    service.pay user, 500

  end

  it "forbids a regular user to perform payments" do
    service = PaymentServiceFactory.for user
    -> { service.pay manager, 500}.must_raise ForbiddenAccessError
  end
end