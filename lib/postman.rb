class Postman

  def self.deliver
    letter = Letter.for_send
    LetterMailer.send_mail(letter).deliver
    letter.update status: :sent
  end
end

