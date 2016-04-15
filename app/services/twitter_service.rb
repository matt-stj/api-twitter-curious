class TwitterService
  attr_reader :client

  def initialize(user)

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_consumer_api_key']
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def followers
    client.followers
  end

  def following
    client.following
  end

  def user_tweets
    client.user_timeline
  end

  def home_timeline
    client.home_timeline
  end

  def profile_image_url
    uri = client.user.profile_image_url
    origin = uri.origin
    path = uri.path
    origin + path
  end

-----------------------original service method---------------
  def user_name
    client.user.name
  end
-------------------------------------------------------------

----------------------new_service method---------
  def user_info
    client.user
  end
-------------------------------------------

---------PORO---------------

  class UserInfo

    def initialize(user)
      @user = OpenStruct.new(user)
    end

    #OpenStrucut before user???

    def user_name
      self.user.name
    end

  end

---------end_PORO---------------------

  def user_handle
    client.user.screen_name
  end

end
