require 'rails_helper'

feature 'click buttons' do
  scenario 'guest can not see edit and delete buttons' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_no_text(I18n.t('buttons.edit'))
    expect(page).to have_no_text(I18n.t('approve'))
    expect(page).to have_no_text(I18n.t('buttons.delete'))
  end

  scenario 'user(author) can see and click edit button' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(user.email, user.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('buttons.edit'))
    find_link(I18n.t('buttons.edit')).click
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('back'))
  end

  scenario 'user(author) can see and click delete button' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(user.email, user.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('buttons.delete'))
    find_link(I18n.t('buttons.delete')).click
    expect(page).to have_no_text('2207')
  end

  scenario 'user(author) can not see approve button' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :new,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(user.email, user.password)
    visit root_path
    expect(page).to have_no_text(I18n.t('approve'))
  end

  scenario 'user(not author) can not see edit and delete buttons' do
    user = FactoryGirl.create(:user, id: 2)
    user1 = FactoryGirl.create(:user1)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :new,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(user.email, user.password)
    visit root_path
    expect(page).to have_no_text('2207')
    expect(page).to have_no_text(I18n.t('buttons.edit'))
    expect(page).to have_no_text(I18n.t('buttons.delete'))
    expect(page).to have_no_text(I18n.t('approve'))
  end

  scenario 'admin(author) can see and click edit button' do
    admin = FactoryGirl.create(:admin, id: 100)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 100,
                                  id: 1,
                                  category_id: 2)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('buttons.edit'))
    find_link(I18n.t('buttons.edit')).click
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('back'))
    expect(page).to have_text(I18n.t('buttons.submit'))
  end

  scenario 'admin(not author) can not see edit button' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    admin = FactoryGirl.create(:admin, id: 100)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_no_text(I18n.t('buttons.edit'))
  end

  scenario 'admin(author) can see and click delete button' do
    admin = FactoryGirl.create(:admin, id: 100)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 100,
                                  id: 1,
                                  category_id: 2)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('buttons.delete'))
    find_link(I18n.t('buttons.delete')).click
    expect(page).to have_text(I18n.t('ad.destroyed'))
    expect(page).to have_no_text('2207')
  end

  scenario 'admin(not author) can see and click delete button' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    admin = FactoryGirl.create(:admin, id: 100)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  aasm_state: :approved,
                                  approval_date: (Time.now - 1.day),
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('buttons.delete'))
    find_link(I18n.t('buttons.delete')).click
    expect(page).to have_text(I18n.t('ad.destroyed'))
    expect(page).to have_no_text('2207')
  end

  scenario 'admin(author) can see and click approve button' do
    admin = FactoryGirl.create(:admin, id: 100)
    category = FactoryGirl.create(:category, id: 2)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  user_id: 100,
                                  id: 1,
                                  category_id: 2,
                                  aasm_state: :new)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('approve'))
    find_link(I18n.t('approve')).click
    expect(page).to have_text(I18n.t('ad.approved'))
  end

  scenario 'admin(not author) can see and click approve button' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 2)
    admin = FactoryGirl.create(:admin, id: 100)
    ads_item = FactoryGirl.create(:ads_item,
                                  title: '2207',
                                  user_id: 1,
                                  id: 1,
                                  category_id: 2,
                                  aasm_state: :new)
    signin(admin.email, admin.password)
    visit root_path
    expect(page).to have_text('2207')
    expect(page).to have_text(I18n.t('approve'))
    find_link(I18n.t('approve')).click
    expect(page).to have_text(I18n.t('ad.approved'))
  end
end
