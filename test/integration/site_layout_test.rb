require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
    def setup
        @user = User.create(username: "Sego", email: "sego@example.com", password: "motdepasse")
    end

    test "should redirect to signup page if not logged in" do
        get root_path
        assert_redirected_to home_warning_path
    end

end
