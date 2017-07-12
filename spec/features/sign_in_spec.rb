require 'rails_helper'

feature 'Sign in', :devise do
  scenario 'user cannot sing in if not registered' do
    signin('person@example.com', 'password')
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'user can sign in with valid credentials' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    expect(page).to have_selector 'form.new_ads_item'
  end

  scenario 'user can not sign in with incorrect email' do
    user = FactoryGirl.create(:user)
    signin('invalid@email.com', user.password)
    expect(page).to have_content 'Invalid Email or password'
  end

  scenario 'user can not sign in with incorrect password' do
    user = FactoryGirl.create(:user)
    signin(user.email, 'incorrect_password')
    expect(page).to have_content 'Invalid Email or password'
  end
end
