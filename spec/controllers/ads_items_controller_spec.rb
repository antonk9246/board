require 'rails_helper'

RSpec.describe AdsItemsController, :type => :controller do
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
      login_with create( :admin )
    end

    it "show index page for admin" do
      get :index
      expect(response).to have_http_status(200)
    end
  end

# set_approve +++++++++++++++++++++++++++++++++++

  describe "set_approve controller for admin" do
    before :each do
      login_with create( :user )
    end

    it "set_approve for admin" do
      patch :set_approve
      expect(response).to have_http_status(200)
    end
  end
 
end