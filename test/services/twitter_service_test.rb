require './test/test_helper'

class TwitterServiceTest < ActiveSupport::TestCase
  attr_reader :service, :user

  def setup
    create_user
    @service = TwitterService.new(user)
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

      assert_equal 11, user_tweets.count
      assert_equal "Testing another way of posting",  first_user_tweet.text
    end
  end

  test '#home_timeline' do
    VCR.use_cassette('twitter_service#home_timeline') do
      home_timeline = service.home_timeline
      last_home_timeline_tweet  = home_timeline.last

      assert_equal 20, home_timeline.count
      assert_equal "The most useful and entertaining tech gifts this year https://t.co/HS3w7s4NxV https://t.co/71D8fsAEV9",  last_home_timeline_tweet.text
    end
  end

  test '#profile_image_url' do
    VCR.use_cassette('twitter_service#profile_image_url') do
      profile_image_url = service.profile_image_url

      assert_equal "http://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png", profile_image_url
    end
  end

  test '#user_name' do
    VCR.use_cassette('twitter_service#user_name') do
      user_name = service.user_name

      assert_equal "MattsApicuriousacct", user_name
    end
  end

  test '#user_handle' do
    VCR.use_cassette('twitter_service#owner_name') do
      user_handle = service.user_handle

      assert_equal "MattsApicouri", user_handle
    end
  end

  test '#tweet_favorited?' do
    VCR.use_cassette('twitter_service#tweet_favorited?') do
      tweet = service.home_timeline.first

      assert_equal false, tweet.favorited?
    end
  end

  test '#user_posts_tweet' do
    service.stubs(:update).returns(Twitter::Tweet.new(id: 123456))
    VCR.use_cassette('twitter_service#update') do

      assert_equal Twitter::Tweet, service.update("Tweet Test").class
    end
  end

  test '#user_favorites_tweet' do
    service.stubs(:favorite).returns(Twitter::Tweet.new(id: 123456))
    VCR.use_cassette('twitter_service#favorite') do

      assert_equal Twitter::Tweet, service.favorite("Tweet Test").class
    end
  end

end
