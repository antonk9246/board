require 'rails_helper'

RSpec.describe AdsItemsController, type: :controller do
  let(:ads_item) { FactoryGirl.create(:ads_item) }

  describe "index controller for guest" do
    before :each do
      login_with nil
    end

    it "show index page for guest" do
      get :index
      expect(response).to have_http_status(200)
    end
  end
  
  describe "index controller for user" do
    before :each do
      login_with create( :user )
    end

    it "show index page for user" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "index controller for admin" do
    before :each do
      login_with create( :user, admin: true )
    end

    it "show index page for admin" do
      get :index
      expect(response).to have_http_status(200)
    end
  end


  it "routes get show" do
    expect(:get => "ads_items/1001").to route_to(
      :controller => "ads_items",
      :action => "show",
     :id => "1001"
    )
  end

  
end