require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
    @user = User.new(username: "Sego", email: "sego@example.com", password: "motdepasse")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = "     "
    assert_not @user.valid?
  end
   test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  test "email addresses should be unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

end
