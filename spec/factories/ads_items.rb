FactoryGirl.define do
  factory :ads_item do
    title 'title'
    category_id 2
    aasm_state :draft
    association :user
    association :category
    id 1001
  end
end
