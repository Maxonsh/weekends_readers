require "#{Rails.root}/lib/postman"

desc 'Отправляет письмо'
task send_letter: :environment do
  letter = ::Letter.next_draft_by_queue
  Postman.deliver! letter
end
