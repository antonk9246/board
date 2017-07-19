require "rails_helper"
require 'pundit/matchers'

describe AdsItemPolicy do
  subject { described_class.new(user, ads_item) }
  
  let(:ads_item) { AdsItem.create(user_id: 10) }
    
  context 'being a visitor' do
    let(:user) { nil }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_actions([:create, :update, :edit, :destroy]) }
  end
  
  context 'being an user' do
    let(:user) { User.create(id: 20) }
    
    it { is_expected.to permit_actions([:index, :show, :create]) }
  end

  context 'being an admin' do
    let(:user) { User.create(id: 1, admin: true) }
    
    it { is_expected.to permit_actions([:index, :show, :create, :destroy]) }
  end
  
  # context 'being an log in user' do
  #   let(:ads_item) { AdsItem.create(user_id: 15, title: "new") }
  #   let(:user) { User.create(id: ads_item.user_id, email: "user@user.by") }
    
  #   it { is_expected.to permit_action(:update) }
  # end
end

