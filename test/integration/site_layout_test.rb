require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
    def setup
        @user = User.create(username: "Sego", email: "sego@example.com", password: "motdepasse")
    end

    test "should redirect to signup page if not logged in" do
        get root_path
        assert_redirected_to new_user_session_path
    end

    test "should redirect to gossip if logged_in" do
        @user.save
        get root_path
        post new_user_session_path, params: { user: { email:    'sego@example.com', password:"motdepasse"
                                                    }}
        assert_redirected_to root_path
    end
end
