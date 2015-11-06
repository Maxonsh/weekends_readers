class Postman
  def self.deliver!(letter)
    LetterMailer.send_mail(letter).deliver_now.tap do
      letter.to_send!
    end
  end
end
