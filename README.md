# README

`rails db:setup` - установка базы данных. Команда также создаст в бд 
пользователя с правами администратора (email: "admin@admin.com", password: "firstadmin")

`rake to_archive:old_records` - меняем статус объявлений, которые были опубликованы
более 3 дней назад

`rake spec` - запуск spec тестов

`rails s -b $IP -p $PORT` - запуск сервера
