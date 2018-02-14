require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    def setup
        @user = User.create(username: "Sego", email: "sego@example.com", password: "motdepasse")
    end

    test "should redirect to gossip if sign up" do

        #Inscription
        get new_user_registration_path
        post user_registration_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse"
                                                     }}
        #Connexion
        sign_in(@user)

        #Renvoi vers root
        get gossips_path
    end

    test "gossip page should display all gossips when logged_in with the promocode" do
        @user = User.create(username: "Sego", email: "sego@example.com", password: "motdepasse", promocode: "petitcurieux")

        sign_in(@user)
        get gossips_path
        #Verifie que le nombre de 'content' = le nombre de 'gossips'
        assert_select 'td.content', {:count=>Gossip.count}
    end

    test "a user should be able to delete his gossips" do
        get new_user_session_path
        post new_user_session_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse", promocode: "petitcurieux"
                                                    }}
        #Counting the number of button
        #it should be equal to the number of user id 1 here since the user is Sego
        assert_select 'a', {:count=>Gossip.find_by(user_id:1)}
    end

    test "a user should be able to subscribe with the code" do
        get new_user_registration_path
        post user_registration_path, params: { user: { username: "Sego", email: "sego@example.com", password: "motdepasse", promocode: "petitcurieux"
                                                     }}
        #Login après inscription
        sign_in(@user)
        get gossips_path

        #Asserting that the correct template has been given
        assert_template 'layouts/application'
        assert_template 'gossips/index'
    end

end
