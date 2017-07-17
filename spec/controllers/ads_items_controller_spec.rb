require 'rails_helper'


RSpec.describe AdsItemsController, :type => :controller do
  describe "anonymous user" do
    before :each do
      # This simulates an anonymous user
      login_with nil
    end

    it "show index page" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  it "if user is lig in" do
    login_with create( :user )
    get :index
    expect( response ).to have_http_status(200)
  end
end





# RSpec.describe AdsItemsController, type: :controller do

#   describe "POST #create" do
#     context "with valid attributes" do
#       it "create new ad" do
#         sign_in
#         post :create, params: { ads_item: attributes_for(:ads_item) }
#         expect(AdsItem.count).to eq(1)
#       end
#     end
#   end
# end

# it "blocks unauthenticated access" do
#     sign_in nil
#     get :index
#     expect(response).to redirect_to(new_user_session_path)
#   end
#   it "allows authenticated access" do
#     sign_in
#     get :index
#     expect(response).to be_success
#   end