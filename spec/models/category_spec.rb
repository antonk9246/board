require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { described_class.new(id: 1, ru: 'ru', en: 'en') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid without a ru' do
    subject.ru = ''
    expect(subject).to be_valid
  end

  it 'is valid without a en' do
    subject.en = ''
    expect(subject).to be_valid
  end
end
