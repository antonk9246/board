module Features
  module SessionHelpers
    def signin(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      find_button('Log in').click
    end
    def signup(email, password, password_confirmation)
      visit new_user_registration_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      fill_in 'Password confirmation', with: password_confirmation
      find_button('Sign up').click
    end
    def signout(email)
      visit  ads_items_index_path
      find_button('Log out').click
    end
  end
end
