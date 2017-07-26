require 'rails_helper'

feature 'sort by', :controller => :index do
  scenario 'user see text sorted by author' do
    user = FactoryGirl.create(:user)
    signin(user.email, user.password)
    visit ads_items_index_path
    expect(page).to have_content('Sorted by date')
    find_link(I18n.t('sort_by')).click
    find_link(I18n.t('sort.author')).click
    expect(page).to have_content('Sorted by author')
  end
end