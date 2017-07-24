# require 'rails_helper'
# feature 'Set approve in index path', :devise do
#   scenario 'admin can set approve' do
#     user = FactoryGirl.create(:user)
#     expect(page).to have_no_selector 'form.new_ads_item'
#     signin(user.email, user.password)
#     expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
#     expect(page).to have_selector 'form.new_ads_item'
#     visit ads_items_index_path
#     new_ad_without_title(title: nil)
#     expect(page).to have_content I18n.t "ad.dont_have_title"
#   end
# end 