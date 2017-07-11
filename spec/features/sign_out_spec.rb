 require 'rails_helper'

 feature 'Sign out', :devise do
   scenario 'user can sign out' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    signout(user.email)
    expect(page).to have_content 'Signed out'
   end
 end