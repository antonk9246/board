require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(id: 1, password: 'password', email: 'admin@admin.com') }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    subject.email = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = ''
    expect(subject).to_not be_valid
  end
end
