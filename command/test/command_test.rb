require 'minitest/autorun'
require_relative "../lib/show_message_button"

describe "Button" do
  it "triggers something" do
    button = Button.new(
      label: "Click me!",
      action: ShowMessage
    )

    capture_io { button.click }.must_include "Button was clicked!\n"
  end
end