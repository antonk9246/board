FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'
  end
  factory :user1 do
    email 'test@example.com'
    password 'password'
    admin true
  end
end
