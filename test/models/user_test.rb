require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def create_user
    user = User.create({ name: "MattsApicuriousacct", screen_name: "MattsApicouri", uid: "4559941044",
                      oauth_token: "234567",
                      oauth_token_secret: "34567" })
    user
  end

  test "a user has a name" do
    user = create_user

    assert_equal "4559941044", user.uid
    assert_equal "MattsApicuriousacct", user.name
    assert_equal "MattsApicouri", user.screen_name
    assert_equal "234567", user.oauth_token
    assert_equal "34567", user.oauth_token_secret
  end

end
