class TwitterServiceMock
  def user
    OpenStruct.new({profile_image_url: "https://pbs.twimg.com/profile_images/659241455748149248/b-pg270C.jpg"})
  end

  def home_timeline
    OpenStruct.new({count: 20})
  end

  def following
    OpenStruct.new({count: 120})
  end

  def followers
    OpenStruct.new({count: 220})
  end

end
