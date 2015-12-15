class TwitterService
  attr_reader :client

  def initialize(user)
    #this will get triggered in the controller
    #and it will send back some JSON bullshit that we want to turn into an object
    #so make a separate class to turn the json into an object and then hand it back to the controller
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['twitter_consumer_api_key']
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  # Wrap their shit with our shit so we're calling methods 
  # def update(message)
  #   @celint.update(message)
  # end

end
