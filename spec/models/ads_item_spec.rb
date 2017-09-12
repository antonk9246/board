require 'rails_helper'

RSpec.describe AdsItem, type: :model do
  user = FactoryGirl.create(:user, id: 1)
  category = FactoryGirl.create(:category, id: 1)
  subject { described_class.new(id: 1,
                                title: 'Title',
                                category_id: category.id,
                                aasm_state: :draft,
                                user_id: user.id) }

  it 'is valid with valid attributes' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    subject.title = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid with title length > 100 ' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    subject.title = '1' * 101
    expect(subject).to_not be_valid
  end

  it 'is not valid with text length > 300' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    subject.text = '1' * 301
    expect(subject).to_not be_valid
  end

  it 'is not valid without a category' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    subject.category_id = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without a user' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    subject.category_id = ''
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'is valid without a state' do
    user = FactoryGirl.create(:user, id: 1)
    category = FactoryGirl.create(:category, id: 1)
    subject.aasm_state = nil
    expect(subject).to be_valid
  end
end
