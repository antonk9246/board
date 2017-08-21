# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
User.create(email: 'admin@admin.com', password: 'firstadmin', admin: 't')
Category.create(ru: 'Телефоны и аксессуары', en: 'Phones & Accessories')
Category.create(ru: 'Компьютеры и планшеты', en: 'Computer & Office')
Category.create(ru: 'Электроника', en: 'Consumer Electronics')
Category.create(ru: 'Бытовая техника', en: 'Home Improvement')
Category.create(ru: 'Одежда для женщин', en: 'Women’s Clothing')
Category.create(ru: 'Одежда для мужчин', en: 'Men’s Clothing')
Category.create(ru: 'Всё для детей', en: 'Toys, Kids & Baby')
Category.create(ru: 'Бижутерия и часы', en: 'Jewelry & Watches')
Category.create(ru: 'Сумки и обувь', en: 'Bags & Shoes')
Category.create(ru: 'Для дома и сада', en: 'Home & Garden, Furniture')
Category.create(ru: 'Автотовары', en: 'Automobiles & Motorcycles')
Category.create(ru: 'Красота и здоровье', en: 'Health & Beauty, Hair')
Category.create(ru: 'Спорт и развлечения', en: 'Sports & Outdoors')

# AdsItem.create(id: 1, user_id: 1, approval_date: 5.days.ago, category_id: 1, title: "5 days ago", aasm_state: :approved)
# AdsItem.create(id: 2, user_id: 1, approval_date: 2.days.ago, category_id: 1, title: "2 days ago", aasm_state: :approved)
# AdsItem.create(id: 3, user_id: 1, approval_date: 3.days.ago, category_id: 1, title: "3 days ago", aasm_state: :approved)
# AdsItem.create(id: 4, user_id: 1, approval_date: 10.days.ago, category_id: 1, title: "10 days ago", aasm_state: :approved)
# AdsItem.create(id: 5, user_id: 1, approval_date: 10.days.ago, category_id: 1, title: "new", aasm_state: :new)

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
