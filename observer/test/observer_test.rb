require 'minitest/autorun'
require_relative "../lib/user"

module Application
  describe User do
    let(:user) { User.new "josemotanet", "Jose Mota", "Software Designer" }

    it "notifies spectators of changes to the User" do
      observer = Minitest::Mock.new
      observer.expect :updated, nil, [ user ]

      user.subscribe observer


      observer.verify
    end

    it "prints the contents of the changed user" do
      observer = UserObserver.new
      user.subscribe observer

      capture { user.update :username, "josemota" }.string to_s.must_include "josemota"
    end
  end
end