require 'minitest/autorun'
require_relative "../lib/video"
require_relative "../lib/proxy"

class ForbiddenAccessError < StandardError; end

describe VideoAuthenticationProxy do
  it "allows priviliged users to access the video" do
    video = Video.new "My First Video", "My first description"
    proxy = VideoAuthenticationProxy.new(video, 'Priviledged')
    proxy.play
    capture_io { proxy.play }.to_s.must_include "My First Video"
    capture_io { proxy.play }.to_s.must_include "My first description"
  end

  it "forvids regular users to access the videos" do
    video = Video.new "My First Video", "My first description"
    proxy = VideoAuthenticationProxy.new(video, 'Anonymous')

    -> { proxy.play }.must_raise ForbiddenAccessError
  end
end
