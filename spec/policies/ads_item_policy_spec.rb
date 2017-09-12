require 'rails_helper'
require 'pundit/matchers'

describe AdsItemPolicy do
  subject { AdsItemPolicy.new(user, ads_item) }

  context 'being a visitor (state - approved)' do
    let(:user) { nil }
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) do
      FactoryGirl.create(:ads_item,
                         aasm_state: :approved,
                         category_id: category.id)
    end
    it { is_expected.to permit_actions(%i[index show]) }
    it { is_expected.to forbid_actions(%i[create update edit destroy
                                       to_new decline return])}
  end

  context 'being a visitor (state - new)' do
    let(:user) { nil }
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) do
      FactoryGirl.create(:ads_item, aasm_state: :new,
                                    category_id: category.id)
    end
    it { is_expected.to permit_action(:index) }
    it { is_expected.to forbid_actions(%i[create show update edit destroy                                          approve to_new decline return]) }
  end

  context 'user is creator (state - approved)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) do
      FactoryGirl.create(:ads_item, aasm_state: :approved, category_id: category.id)
    end
    let(:user) { User.create(id: ads_item.user_id) }

    it {
      is_expected.to permit_actions(%i[index show create destroy edit
                                    update])}
    it { is_expected.to forbid_actions(%i[approve to_new decline return]) }
  end

  context 'user is creator (state - new)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :new,
                                        category_id: category.id) }
    let(:user) { User.create(id: ads_item.user_id) }

    it { is_expected.to permit_actions(%i[index show edit create destroy update return]) }
    it { is_expected.to forbid_actions(%i[approve to_new decline]) }
  end

  context 'user is not creator (state - approved)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :approved, category_id: category.id) }
    let(:user) { User.create(id: 10) }

    it { is_expected.to permit_actions(%i[index show create]) }
    it { is_expected.to forbid_actions(%i[edit destroy update approve to_new decline return]) }
  end

  context 'user is not creator (state - new)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :new, category_id: category.id) }
    let(:user) { User.create(id: 10) }

    it { is_expected.to permit_actions(%i[index create]) }
    it { is_expected.to forbid_actions(%i[show edit destroy update approve to_new decline return]) }
  end

  context 'admin is creator (state - approved)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :approved, category_id: category.id) }
    let(:user) { User.create(id: ads_item.user_id, admin: true) }
    it { is_expected.to permit_actions(%i[index show create destroy edit update]) }
    it { is_expected.to forbid_actions(%i[to_new decline return approve]) }
  end

  context 'admin is creator (state - new)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :new, category_id: category.id) }
    let(:user) { User.create(id: ads_item.user_id, admin: true) }
    it { is_expected.to permit_actions(%i[index show edit create destroy update approve decline return]) }
    it { is_expected.to forbid_action(:to_new) }
  end

  context 'admin is not creator (state - approved)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :approved, category_id: category.id) }
    let(:user) { User.create(id: 10, admin: true) }

    it { is_expected.to permit_actions(%i[index show create destroy]) }
    it { is_expected.to forbid_actions(%i[edit update to_new decline return approve]) }
  end

  context 'admin is not creator (state - new)' do
    let(:category) { FactoryGirl.create(:category) }
    let(:ads_item) { FactoryGirl.create(:ads_item, aasm_state: :new, category_id: category.id) }
    let(:user) { User.create(id: 10, admin: true) }

    it { is_expected.to permit_actions(%i[index create show destroy decline approve]) }
    it { is_expected.to forbid_actions(%i[edit update to_new return]) }
  end
end
