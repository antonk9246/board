require 'rails_helper'

feature 'click buttons', :devise do
  scenario 'guest can see and click show button' do
    guest
    user = FactoryGirl.create(:user, id: 1)
    ads_item = FactoryGirl.create(:ads_item, title: "2207", approved: true, approval_date: (Time.now - 1.day), user_id: 1, id: 1)
    visit ads_items_index_path
    expect(page).to have_text("2207")
    find_link(I18n.t'buttons.show').click
    expect(page).to have_text("2207")
    expect(page).to have_text(I18n.t'back')
  end

  scenario 'guest can not see edit button' do
    guest
    user = FactoryGirl.create(:user, id: 1)
    ads_item = FactoryGirl.create(:ads_item, title: "2207", approved: true, approval_date: (Time.now - 1.day), user_id: 1, id: 1)
    visit ads_items_index_path
    expect(page).to have_text("2207")
    expect(page).to have_no_text(I18n.t'buttons.edit')
  end

  scenario 'guest can not see delete button' do
    guest
    user = FactoryGirl.create(:user, id: 1)
    ads_item = FactoryGirl.create(:ads_item, title: "2207", approved: true, approval_date: (Time.now - 1.day), user_id: 1, id: 1)
    visit ads_items_index_path
    expect(page).to have_text("2207")
    expect(page).to have_no_text(I18n.t'buttons.delete')
  end

  scenario 'guest can not see approve button' do
    guest
    user = FactoryGirl.create(:user, id: 1)
    ads_item = FactoryGirl.create(:ads_item, title: "2207", approved: true, approval_date: (Time.now - 1.day), user_id: 1, id: 1)
    visit ads_items_index_path
    expect(page).to have_text("2207")
    expect(page).to have_no_text(I18n.t'approve')
  end
end