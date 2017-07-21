FactoryGirl.define do
  factory :ads_item do
    title 'title'
    association :user
    id 1001
  end
end
