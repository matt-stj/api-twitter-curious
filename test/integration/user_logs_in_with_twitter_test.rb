require "test_helper"

  class UserLogsInWithTwitterTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

    def setup
      Capybara.app = ApiTwitterCurious::Application
      stub_omniauth
    end

    test "logging in and logging out" do
      visit "/"
      assert_equal 200, page.status_code
      click_link "Login with Twitter »"
      assert_equal "/users", current_path
      assert page.has_content?("MattsApicouri")
      assert page.has_link?("logout")

      click_link("logout")
      assert_equal "/" current_path
      assert page.has_content?("Thanks for visiting. You've been logged out.")
    end

    def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(
          {"provider"=>"twitter",
       "uid"=>"4559941044",
       "info"=>
        {"nickname"=>"MattsApicouri",
         "name"=>"MattsApicuriousacct",
         "email"=>nil,
         "location"=>"",
         "image"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
         "description"=>"",
         "urls"=>{"Website"=>nil, "Twitter"=>"https://twitter.com/MattsApicouri"}},
       "credentials"=>{"token"=>ENV['oauth_token'], "secret"=>ENV["oauth_token_secret"]},
       "extra"=>{
       "raw_info"=>
        {"id"=>4559941044,
         "id_str"=>"4559941044",
         "name"=>"MattsApicuriousacct",
         "screen_name"=>"MattsApicouri",
         "location"=>"",
         "description"=>"",
         "url"=>nil,
         "entities"=>{"description"=>{"urls"=>[]}},
         "protected"=>false,
         "followers_count"=>1,
         "friends_count"=>8,
         "listed_count"=>0,
         "created_at"=>"Mon Dec 14 21:44:11 +0000 2015",
         "favourites_count"=>5,
         "utc_offset"=>nil,
         "time_zone"=>nil,
         "geo_enabled"=>false,
         "verified"=>false,
         "statuses_count"=>14,
         "lang"=>"en",
         "contributors_enabled"=>false,
         "is_translator"=>false,
         "is_translation_enabled"=>false,
         "profile_background_color"=>"F5F8FA",
         "profile_background_image_url"=>nil,
         "profile_background_image_url_https"=>nil,
         "profile_background_tile"=>false,
         "profile_image_url"=>"http://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
         "profile_image_url_https"=>"https://abs.twimg.com/sticky/default_profile_images/default_profile_1_normal.png",
         "profile_link_color"=>"2B7BB9",
         "profile_sidebar_border_color"=>"C0DEED",
         "profile_sidebar_fill_color"=>"DDEEF6",
         "profile_text_color"=>"333333",
         "profile_use_background_image"=>true,
         "has_extended_profile"=>false,
         "default_profile"=>true,
         "default_profile_image"=>true,
         "following"=>false,
         "follow_request_sent"=>false,
         "notifications"=>false}}})
  end
end
