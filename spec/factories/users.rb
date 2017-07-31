FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'
    admin false
  end
  factory :admin, class: User do
    email 'test@example.com'
    password 'password'
    admin true
  end
end
