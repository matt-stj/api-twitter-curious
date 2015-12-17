require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service, :user

  def create_user
    @user = User.new(id: 1,
    name: "MattsApicuriousacct",
    screen_name: "MattsApicouri",
    uid: "4559941044",
    oauth_token: ENV["oauth_token"],
    oauth_token_secret: ENV["oauth_token_secret"])
  end

  def setup
    create_user
    @service ||= TwitterService.new(user)
  end

  test '#followers' do
    VCR.use_cassette('twitter_service#followers') do
      followers = service.followers
      follower  = followers.first

      assert_equal 1,      followers.count
      assert_equal 'thew88',  follower.name
    end
  end

  test '#following' do
    VCR.use_cassette('twitter_service#following') do
      following = service.following
      first_following  = following.first

      assert_equal 8,      following.count
      assert_equal "The New York Times",  first_following.name
    end
  end

  test '#user_tweets' do
    VCR.use_cassette('twitter_service#user_tweets') do
      user_tweets = service.user_tweets
      first_user_tweet  = user_tweets.first

      assert_equal 11,      user_tweets.count
      assert_equal "Testing another way of posting",  first_user_tweet.text
    end
  end

end
