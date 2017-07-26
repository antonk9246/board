# README

`rails db:setup` - установка базы данных. Команда также создаст в бд 
пользователя с правами администратора (email: "admin@admin.com", password: "firstadmin")

`rake delete:old_records` - удаление всех реклам, которые были опубликованы
более 60 дней назад

`rake spec` - запуск spec тестов

`rails s -b $IP -p $PORT` - запуск сервера
