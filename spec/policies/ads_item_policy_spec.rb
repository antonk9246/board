require "rails_helper"
require 'pundit/matchers'

describe AdsItemPolicy do
  subject { AdsItemPolicy.new(user, ads_item) }
  let(:ads_item) { FactoryGirl.create(:ads_item) }
  
  # let(:ads_item) { AdsItem.create(user_id: 1001) }
    
  context 'being a visitor' do
    let(:user) { nil }
    it { is_expected.to permit_actions([:index, :show]) }
    it { is_expected.to forbid_actions([:create, :update, :edit, :destroy, :set_approve]) }
  end
  
  context 'being an user' do
    let(:ads_item) { FactoryGirl.create(:ads_item) }
    let(:user) { User.create(id: ads_item.user_id) }

    it { is_expected.to permit_actions([:index, :show, :create, :destroy, :edit, :update]) }
    it { is_expected.to forbid_action(:set_approve) }
  end

  context 'being an admin' do
    let(:ads_item) { FactoryGirl.create(:ads_item) }
    let(:user) { User.create(id: 1, admin: true) }
    
    it { is_expected.to permit_actions([:index, :show, :create, :destroy, :edit, :update, :set_approve]) }
  end
end

