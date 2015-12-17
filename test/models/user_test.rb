require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user can be created with proper attributes" do
    user = User.new({ name: "MattsApicuriousacct", screen_name: "MattsApicouri", uid: "4559941044",
                      oauth_token: "234567",
                      oauth_token_secret: "34567" })
                      
    assert user.valid?
  end
end
