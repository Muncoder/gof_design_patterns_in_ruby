class VideoAuthenticationProxy
  def initialize(video, user)
    @video = video
    @user = user
  end

  def play
    if @user == 'Priviledged'
      @video.play
    else
      raise ForbiddenAccessError, "Only priviledged users are allowed"
    end
  end
end
