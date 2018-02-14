require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    def setup
        @user = User.create(username: "Sego", email: "sego@example.com", password: "motdepasse")
    end

    test "should redirect to index if logged in" do
        @user.save
        get root_path
        post new_user_session_path, params: { user: { email: "sego@example.com", password: "motdepasse"
                                                    }}
        assert_redirected_to root_path
    end

    test "should redirect to gossip if sign up" do

        #Register a new user
        get new_user_registration_path
        post user_registration_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse"
                                                     }}
        #Signing in after register
        sign_in(@user)
        #Going to gossips#index
        get gossips_path

        #Testing the layout
        assert_template 'layouts/application'
        assert_template 'gossips/index'
        assert_template 'shared/_flash'
    end

    test "gossip page should display all gossips when logged_in with the code" do
        @user = User.create(username: "Sego", email: "sego@example.com", password: "motdepasse", code: "petitcurieux")

        sign_in(@user)
        get gossips_path
        #Counting the number of content
        #it should be equal to the number of gossips
        assert_select 'td.content', {:count=>Gossip.count}
    end

    test "a user should be able to delete his gossips" do
        get new_user_session_path
        post new_user_session_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse", code: "petitcurieux"
                                                    }}
        #Counting the number of button
        #it should be equal to the number of user id 1 here since the user is Mathieu
        assert_select 'a', {:count=>Gossip.find_by(user_id:1)}
    end

    test "a user without the code should not be able see the gossips" do
        get new_user_session_path
        post new_user_session_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse"
                                                    }}
        #Counting the number of content
        #it should be equal to 0
        assert_select 'td.content', {:count=>0}
    end

    test "a user should be able to subscribe with the code" do
        get new_user_registration_path
        post user_registration_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse", code: "petitcurieux"
                                                     }}
        #Signing in after register
        sign_in(@user)
        get gossips_path

        #Asserting that the correct template has been given
        assert_template 'layouts/application'
        assert_template 'gossips/index'
        assert_template 'shared/_flash'
    end

end
