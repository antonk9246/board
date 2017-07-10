FactoryGirl.define do
  factory :ads_item do
    title 'Title'
    association :user
  end
end
