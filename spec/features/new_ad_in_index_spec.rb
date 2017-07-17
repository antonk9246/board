#  require 'rails_helper'

# feature 'New ad in index', :devise do
#   scenario 'user can create new ad in index path' do
#     user = FactoryGirl.create(:user)
#     expect(page).to have_no_selector 'form.new_ads_item'
#     signin(user.email, user.password)
#     expect(page).to have_content I18n.t 'devise.sessions.user.signed_in'
#     expect(page).to have_selector 'form.new_ads_item'
#     new_ad_without_title(title: nil)
#     visit ads_items_index_path
#     expect(page).to have_content I18n.t "ad.dont_have_title"
#   end
# end 