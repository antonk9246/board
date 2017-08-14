require 'rails_helper'

feature 'Form for new ad in index', :controller => :index do
  scenario 'guest can not see form for new ad in index path' do
    user = FactoryGirl.create(:user, id: nil)
    visit root_path
    expect(page).to have_no_selector 'form.new_ads_item'
  end

  scenario 'user can see form for new ad in index path' do
    user = FactoryGirl.create(:user)
    expect(page).to have_no_selector 'form.new_ads_item'
    signin(user.email, user.password)
    root_path
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    expect(page).to have_selector 'form.new_ads_item'
  end

  scenario 'admin can see form for new ad in index path' do
    admin = FactoryGirl.create(:admin)
    visit root_path
    expect(page).to have_no_selector 'form.new_ads_item'
    signin(admin.email, admin.password)
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    expect(page).to have_selector 'form.new_ads_item'
  end
end
