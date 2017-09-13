require 'rails_helper'

feature 'sort by', controller: :index do
  scenario 'guest can sort ads' do
    visit root_path
    expect(page).to have_content('Ads Board')
    find_link(I18n.t('sort.date')).click
    find_link(I18n.t('sort.author')).click
    expect(page).to have_content('Sorted by author')
  end

  scenario 'user can sort ads' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    expect(page).to have_content('Ads Board')
    find_link(I18n.t('sort.date')).click
    find_link(I18n.t('sort.author')).click
    expect(page).to have_content('Sorted by author')
  end

  scenario 'admin can sort ads' do
    admin = FactoryGirl.create(:admin)
    signin(admin.email, admin.password)
    expect(page).to have_content('Ads Board')
    find_link(I18n.t('sort.date')).click
    find_link(I18n.t('sort.author')).click
    expect(page).to have_content('Sorted by author')
  end
end
