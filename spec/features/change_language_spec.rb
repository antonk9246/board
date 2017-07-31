require 'rails_helper'

feature 'change language', :set_locale do
  scenario 'guest can change language' do
    visit ads_items_index_path
    find_link(I18n.t('language')).click
    find_link('Русский').click
    expect(page).to have_content('Доска Объявлений')
    find_link('Язык').click
    find_link('English').click
    expect(page).to have_content('Ads Board')
  end

  scenario 'user can change language' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit ads_items_index_path
    find_link(I18n.t('language')).click
    find_link('Русский').click
    expect(page).to have_content('Доска Объявлений')
    find_link('Язык').click
    find_link('English').click
    expect(page).to have_content('Ads Board')
  end

  scenario 'admin can change language' do
    user = FactoryGirl.create(:admin)
    signin(user.email, user.password)
    visit ads_items_index_path
    find_link(I18n.t('language')).click
    find_link('Русский').click
    expect(page).to have_content('Доска Объявлений')
    find_link('Язык').click
    find_link('English').click
    expect(page).to have_content('Ads Board')
  end
end
