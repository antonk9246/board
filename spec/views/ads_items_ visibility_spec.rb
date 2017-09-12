require 'rails_helper'

feature 'visibility for ads' do
  scenario 'guest can not see ads where state archived' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :archived,
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    visit root_path
    expect(page).to have_no_text('2207')
  end

  scenario 'user can not see ads where state archived' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :archived,
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(user.email, user.password)
    expect(page).to have_no_content '2207'
  end

  scenario 'admin can see ads where state archived' do
    user = FactoryGirl.create(:user, id: 1, admin: true)
    category = FactoryGirl.create(:category, id: 2)
    FactoryGirl.create(:ads_item,
                       title: '2207',
                       aasm_state: :archived,
                       user_id: 1,
                       id: 1,
                       category_id: 2)
    signin(user.email, user.password)
    expect(page).to have_no_content '2207'
  end
end
