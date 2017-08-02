FactoryGirl.define do
  factory :user do
    email 'test@example.com'
    password 'password'
    admin false
  end

  factory :user1, class: User do
    email 'user1@example.com'
    password 'password'
    id 1
    admin false
  end
  
  factory :admin, class: User do
    email 'admin@admin.com'
    password 'adminadmin'
    admin true
  end
end
