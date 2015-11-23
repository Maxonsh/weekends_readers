class LetterMailer < ApplicationMailer
  def send_mail(letter)
    @letter = letter
    mail(
      to: 'staff@cifronomika.ru',
      subject: 'Что почитать на выходных'
    )
  end
end
