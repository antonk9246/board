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

AdsItem.create(user_id: 1,
               approval_date: 5.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/1.jpg"))],
               category_id: 11, title: 'Продам машину-2007',
               text: '150 000 р',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/2.jpg"))],
               category_id: 11,
               title: 'Вольво срочно-2008',
               text: 'Договорная',
               aasm_state: :new)
AdsItem.create(user_id: 1,
               approval_date: 3.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/3.jpg"))],
               category_id: 11,
               title: 'Форд фокус 3-2012',
               text: '16700 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 1.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/4.jpg"))],
               category_id: 13,
               title: 'Велосипед BMW super bike новый.',
               text: '500 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 1.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/5.jpg"))],
               category_id: 13,
               title: 'Бутсы',
               text: 'Состояние б/у. Цена: 40 р',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/6.jpg"))],
               category_id: 12,
               title: 'Коррекция фигуры, обертывания',
               text: '20 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/7.jpg"))],
               category_id: 10,
               title: 'МЕБЕЛЬ ДЛЯ ДОМА И КУХНИ ДОСТАВКА по РБ',
               text: '15 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/8.jpg"))],
               category_id: 10,
               title: 'Полка навесная для книг',
               text: '30 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/9.jpg"))],
               category_id: 9,
               title: 'Сумка Guess',
               text: '30 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 1.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/10.jpg"))],
               category_id: 9,
               title: 'Туфли НАТ. замш размер 37',
               text: '50 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 0.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/11.jpg")),
               (File.new("#{Rails.root}/public/seeds/12.jpg"))],
               category_id: 8,
               title: 'Наручные часы Certina DS 1 (C006.407.16.051.00)',
               text: '750 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/13.jpg"))],
               category_id: 7,
               title: 'Машинка',
               text: '20 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 1.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/14.jpg"))],
               category_id: 6,
               title: 'Верхняя Одежда 46-48размер,звоните договоримся',
               text: 'Договорная',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/15.jpg"))],
               category_id: 5,
               title: 'Куртка стильная на осень, р.48.',
               text: '20 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 3.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/16.jpg"))],
               category_id: 4,
               title: 'Стиральная машина Indesit Б/У с Гарантией и Рассрочкой',
               text: 'Договорная',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/17.jpg"))],
               category_id: 3,
               title: 'Фрезер Интерскол ФМ-32/1900Э Гарантия 2 года',
               text: '220 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 2.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/18.jpg"))],
               category_id: 2,
               title: 'Мощный игровой компьютер с монитором 32',
               text: '3000 p',
               aasm_state: :approved)
AdsItem.create(user_id: 1,
               approval_date: 1.days.ago,
               images: [(File.new("#{Rails.root}/public/seeds/19.jpg"))],
               category_id: 1,
               title: 'Мобильные телефоны',
               text: '150 p',
               aasm_state: :approved)
