require 'rails_helper'

feature 'Sign up', :devise do
  scenario 'user can sign up with valid credentials' do
    signup('user@mail.ru', 'password', 'password' )
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'user can not sign up with invalid password confirmation' do
    signup('user@mail.ru', 'password', 'passwork' )
    expect(page).to have_content "Password confirmation doesn't match Password"
  end
  
  scenario 'user can not sign up with short password' do
    signup('user@mail.ru', 'pass', 'pass' )
    expect(page).to have_content "Password is too short (minimum is 6 characters)"
  end
  
  scenario 'user can not sign up with short password' do
    user = FactoryGirl.create(:user)
    signup('test@example.com', 'password1', 'password1' )
    expect(page).to have_content "Email has already been taken"
  end
end
