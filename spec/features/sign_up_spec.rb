require 'rails_helper'

feature 'Sign up', :devise do
  scenario 'user can sign up with valid credentials' do
    signup('user@mail.ru', 'password', 'password')
    expect(page).to have_content I18n.t 'devise.registrations.user.signed_up'
  end

  scenario 'user can not sign up with invalid password confirmation' do
    signup('user1@mail.ru', 'password', 'plaswork')
    expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.password_confirmation.confirmation')
  end

  scenario 'user can not sign up with short password' do
    signup('user@mail.ru', 'pass', 'pass')
    expect(page).to have_content 'Password is too short (minimum is 6 characters)'
  end

  scenario 'user can not sign up with short password' do
    user = FactoryGirl.create(:user)
    signup('test@example.com', 'password1', 'password1')
    expect(page).to have_content 'Email has already been taken'
  end
end
