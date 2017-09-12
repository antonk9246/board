require 'rails_helper'
feature 'Set approve in index path' do
  scenario 'admin can set approve' do
    user = FactoryGirl.create(:user, id: 1, admin: true)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  category_id: 2,
                                  aasm_state: :new,
                                  user_id: 1,
                                  id: 1)
    expect(page).to have_no_selector 'form.new_ads_item'
    signin(user.email, user.password)
    expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
    find_link(I18n.t('buttons.approve')).click
    expect(page).to have_content(I18n.t('ad.approved'))
  end
end