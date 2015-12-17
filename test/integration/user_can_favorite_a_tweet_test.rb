require 'test_helper'

class UserCanFavoriteATweetTest < ActionDispatch::IntegrationTest
  test "A user can favorite a tweet" do
    visit(root_path)

    click_link("Login with Twitter »")

    assert_equal users_path, current_path
  end
end
