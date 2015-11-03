require 'postman'

desc 'Отправляет письмо'
task send_letter: :environment do
  Postman.deliver
end
