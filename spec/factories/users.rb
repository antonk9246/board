FactoryGirl.define do
  factory :user do
    email         { Faker::Internet.email }
    password       { Faker::Address.password }
  end
end