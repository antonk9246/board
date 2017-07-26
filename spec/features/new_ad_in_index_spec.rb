require 'rails_helper'

feature 'Form for new ad in index', :controller => :index do
  scenario 'guest can not see form for new ad in index path' do
    user = FactoryGirl.create(:user, id: nil)
    expect(page).to have_no_selector 'form.new_ads_item'
  end

  scenario 'user can see form for new ad in index path' do
    user = FactoryGirl.create(:user)
    expect(page).to have_no_selector 'form.new_ads_item'
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    expect(page).to have_selector 'form.new_ads_item'
  end

  scenario 'user can see form for new ad in index path' do
    user = FactoryGirl.create(:user, admin: true)
    expect(page).to have_no_selector 'form.new_ads_item'
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    expect(page).to have_selector 'form.new_ads_item'
  end
end

