FactoryGirl.define do
  factory :ads_item do
    title 'title'
    association :user
  end
end
