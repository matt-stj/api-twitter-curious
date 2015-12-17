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

  end

end
