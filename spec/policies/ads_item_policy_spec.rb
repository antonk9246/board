require "rails_helper"
require 'pundit/matchers'

describe AdsItemPolicy do
  subject { AdsItemPolicy.new(user, ads_item) }
  # let(:ads_item) { FactoryGirl.create(:ads_item) }

  context 'being a visitor (approved true)' do
    let(:user) { nil }
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "t") }
    it { is_expected.to permit_actions([:index, :show]) }
    it { is_expected.to forbid_actions([:create, :update, :edit, :destroy, :set_approve]) }
  end

  context 'being a visitor (approved false)' do
    let(:user) { nil }
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "false") }
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_actions([:create, :show, :update, :edit, :destroy, :set_approve]) }
  end
  
  context 'user is creator (approved true)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "t") }
    let(:user) { User.create(id: ads_item.user_id) }

    it { is_expected.to permit_actions([:index, :show, :create, :destroy, :edit, :update]) }
    it { is_expected.to forbid_action(:set_approve) }
  end

  context 'user is creator (approved false)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "false") }
    let(:user) { User.create(id: ads_item.user_id) }

    it { is_expected.to permit_actions([:index, :show, :edit, :create, :destroy, :update]) }
    it { is_expected.to forbid_action(:set_approve) }
  end

  context 'user is not creator (approved true)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "t") }
    let(:user) { User.create(id: 10) }

    it { is_expected.to permit_actions([:index, :show, :create]) }
    it { is_expected.to forbid_actions([:edit, :destroy, :update, :set_approve]) }
  end

  context 'user is not creator (approved false)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "false") }
    let(:user) { User.create(id: 10) }

    it { is_expected.to permit_actions([:index, :create]) }
    it { is_expected.to forbid_actions([ :show, :edit, :destroy, :update, :set_approve]) }
  end



    context 'admin is creator (approved true)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "t") }
    let(:user) { User.create(id: ads_item.user_id, admin: 't') }

    it { is_expected.to permit_actions([:index, :show, :create, :destroy, :edit, :update, :set_approve]) }
  end

  context 'user is creator (approved false)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "false") }
    let(:user) { User.create(id: ads_item.user_id, admin: 't') }

    it { is_expected.to permit_actions([:index, :show, :edit, :create, :destroy, :update, :set_approve]) }
  end

  context 'user is not creator (approved true)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "t") }
    let(:user) { User.create(id: 10, admin: 't') }

    it { is_expected.to permit_actions([:index, :show, :create, :destroy, :set_approve]) }
    it { is_expected.to forbid_actions([:edit, :update]) }
  end

  context 'user is not creator (approved false)' do
    let(:ads_item) { FactoryGirl.create(:ads_item, approved: "false") }
    let(:user) { User.create(id: 10, admin: 't') }

    it { is_expected.to permit_actions([:index, :create, :show, :destroy, :set_approve]) }
    it { is_expected.to forbid_actions([:edit, :update]) }
  end
end
