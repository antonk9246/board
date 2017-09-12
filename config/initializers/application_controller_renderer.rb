# Be sure to restart your server when you modify this file.

# ApplicationController.renderer.defaults.merge!(
#   http_host: 'example.org',
#   https: false
# )

# Получаем локаль из домена верхнего уровня или возвращаем nil, если такая локаль недоступна
# Вам следует поместить что-то наподобие этого:
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# в ваш файл /etc/hosts, чтобы попробовать это локально
def extract_locale_from_tld
  parsed_locale = request.host.split('.').last
  I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale : nil
end
