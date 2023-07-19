#### Sim Url
https://sim-url.herokuapp.com  

Приложение служит демострацией по созданию коротких урлов.  
Хостится на Heroku.  
Доступна простая регистрация и аутентификация с использованием Devise.
Урлы могут быть пермаментными, либо удаляются джобой которая запускается  
через планировщик Heroku.  

ruby: 3.1.4  
rails: 6.1  
db: postgresql  

Для тестов используются стандартные тесты(minitest), faker, FactoryBot,
simplecov.  
RSpec использовать в таком маленьком приложении нет смысла.

Автор: Виталий  
Телеграм: @RubyWarlock  
Git: https://github.com/rubywarlock/ShortUrls  
